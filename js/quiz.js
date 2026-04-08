// Quiz functionality
class Quiz {
  constructor(containerId) {
    this.container = document.getElementById(containerId);
    this.questions = [];
    this.currentIndex = 0;
    this.answers = {};
    this.submitted = false;
  }

  /**
   * Load questions from Supabase API.
   * @param {object} options - { exam, shuffle, limit }
   */
  async loadFromSupabase(options) {
    options = options || {};
    var exam = options.exam || 'az-305';
    var shuffle = options.shuffle !== false;
    var limit = options.limit || 0;
    var source = options.source || null;
    var category = options.category || null;

    if (!window.supabaseClient) {
      this.container.innerHTML = '<p style="color:#d13438;">Supabase未接続</p>';
      return;
    }

    this.container.innerHTML = '<p style="color:#888;padding:40px 0;text-align:center;">問題を読み込み中...</p>';

    try {
      var query = window.supabaseClient
        .from('questions')
        .select('id, question, choices, answer, explanation, category, tags')
        .eq('exam', exam);

      if (source) {
        query = query.eq('source', source);
      }
      if (category) {
        query = query.eq('category', category);
      }
      if (limit > 0) {
        query = query.limit(limit);
      }

      var result = await query;

      if (result.error) {
        console.error('Questions load error:', result.error);
        this.container.innerHTML = '<p style="color:#d13438;">問題の読み込みに失敗しました。</p>';
        return;
      }

      this.questions = result.data || [];

      if (this.questions.length === 0) {
        this.container.innerHTML = '<p style="color:#888;">利用可能な問題がありません。</p>';
        return;
      }

      if (shuffle) {
        for (var i = this.questions.length - 1; i > 0; i--) {
          var j = Math.floor(Math.random() * (i + 1));
          var tmp = this.questions[i];
          this.questions[i] = this.questions[j];
          this.questions[j] = tmp;
        }
      }

      this.render();
    } catch (e) {
      console.error('Quiz load error:', e);
      this.container.innerHTML = '<p style="color:#d13438;">問題の読み込みに失敗しました。</p>';
    }
  }

  async loadQuestions(jsonPaths) {
    this.questions = [];
    for (const path of jsonPaths) {
      try {
        const res = await fetch(path);
        const data = await res.json();
        this.questions.push(...data.questions);
      } catch (e) {
        console.error(`Failed to load ${path}:`, e);
      }
    }
    this.render();
  }

  loadQuestionsFromData(dataArray) {
    this.questions = [];
    for (const data of dataArray) {
      this.questions.push(...data.questions);
    }
    this.render();
  }

  loadFromArray(questions, shuffle) {
    this.questions = [...questions];
    if (shuffle) {
      for (let i = this.questions.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [this.questions[i], this.questions[j]] = [this.questions[j], this.questions[i]];
      }
    }
    this.render();
  }

  render() {
    if (!this.container || this.questions.length === 0) return;

    const q = this.questions[this.currentIndex];
    const isMulti = Array.isArray(q.answer);
    const userAnswer = this.answers[this.currentIndex];
    const answered = userAnswer !== undefined;

    let html = `
      <div class="quiz-header">
        <span class="quiz-progress">問題 ${this.currentIndex + 1} / ${this.questions.length}</span>
        <div class="quiz-progress-bar">
          <div class="quiz-progress-fill" style="width: ${((this.currentIndex + 1) / this.questions.length) * 100}%"></div>
        </div>
      </div>
      <div class="quiz-question">
        <p>${q.question.replace(/\n/g, '<br>')}</p>
        ${isMulti ? '<p class="quiz-multi-hint">（複数選択）</p>' : ''}
      </div>
      <div class="quiz-choices">
    `;

    q.choices.forEach((choice, i) => {
      let cls = 'quiz-choice';
      if (answered) {
        const correctAnswers = isMulti ? q.answer : [q.answer];
        const userAnswers = isMulti ? (userAnswer || []) : [userAnswer];
        if (correctAnswers.includes(i)) {
          cls += ' correct';
        } else if (userAnswers.includes(i)) {
          cls += ' wrong';
        }
      } else {
        if (isMulti) {
          if (userAnswer && userAnswer.includes(i)) cls += ' selected';
        }
      }

      const inputType = isMulti ? 'checkbox' : 'radio';
      const checked = !answered && ((isMulti && this.pendingMulti && this.pendingMulti.includes(i)) || (!isMulti && this.pendingAnswer === i)) ? 'checked' : '';

      html += `
        <label class="${cls}" data-index="${i}">
          <input type="${inputType}" name="q${this.currentIndex}" value="${i}" ${checked} ${answered ? 'disabled' : ''}>
          <span>${choice}</span>
        </label>
      `;
    });

    html += '</div>';

    if (answered) {
      html += `
        <div class="quiz-explanation">
          <div class="quiz-explanation-title">解説</div>
          <p>${q.explanation.replace(/\n/g, '<br>')}</p>
        </div>
      `;
    }

    html += '<div class="quiz-nav">';
    if (this.currentIndex > 0) {
      html += '<button class="quiz-btn quiz-prev">← 前の問題</button>';
    } else {
      html += '<span></span>';
    }

    if (!answered) {
      html += '<button class="quiz-btn quiz-submit-answer">回答する</button>';
    } else if (this.currentIndex < this.questions.length - 1) {
      html += '<button class="quiz-btn quiz-next">次の問題 →</button>';
    } else {
      html += '<button class="quiz-btn quiz-show-results">結果を見る</button>';
    }
    html += '</div>';

    this.container.innerHTML = html;
    this.bindEvents();
  }

  bindEvents() {
    const prev = this.container.querySelector('.quiz-prev');
    const next = this.container.querySelector('.quiz-next');
    const submit = this.container.querySelector('.quiz-submit-answer');
    const results = this.container.querySelector('.quiz-show-results');

    if (prev) prev.addEventListener('click', () => { this.currentIndex--; this.render(); });
    if (next) next.addEventListener('click', () => { this.currentIndex++; this.render(); });
    if (submit) submit.addEventListener('click', () => this.submitAnswer());
    if (results) results.addEventListener('click', () => this.showResults());
  }

  submitAnswer() {
    const q = this.questions[this.currentIndex];
    const isMulti = Array.isArray(q.answer);

    if (isMulti) {
      const checked = this.container.querySelectorAll(`input[name="q${this.currentIndex}"]:checked`);
      if (checked.length === 0) return;
      this.answers[this.currentIndex] = Array.from(checked).map(c => parseInt(c.value));
    } else {
      const checked = this.container.querySelector(`input[name="q${this.currentIndex}"]:checked`);
      if (!checked) return;
      this.answers[this.currentIndex] = parseInt(checked.value);
    }
    this.render();
  }

  showResults() {
    let correct = 0;
    const total = this.questions.length;

    this.questions.forEach((q, i) => {
      const userAnswer = this.answers[i];
      if (userAnswer === undefined) return;

      if (Array.isArray(q.answer)) {
        const ua = Array.isArray(userAnswer) ? userAnswer : [userAnswer];
        if (q.answer.length === ua.length && q.answer.every(a => ua.includes(a))) {
          correct++;
        }
      } else {
        if (userAnswer === q.answer) correct++;
      }
    });

    const percentage = Math.round((correct / total) * 100);
    const answered = Object.keys(this.answers).length;

    let html = `
      <div class="quiz-results">
        <h2>結果</h2>
        <div class="quiz-score">
          <div class="quiz-score-number">${correct} / ${total}</div>
          <div class="quiz-score-percent">${percentage}%</div>
          <div class="quiz-score-detail">回答済み: ${answered}問 / 未回答: ${total - answered}問</div>
        </div>
        <div class="quiz-results-list">
    `;

    this.questions.forEach((q, i) => {
      const userAnswer = this.answers[i];
      let isCorrect = false;
      if (userAnswer !== undefined) {
        if (Array.isArray(q.answer)) {
          const ua = Array.isArray(userAnswer) ? userAnswer : [userAnswer];
          isCorrect = q.answer.length === ua.length && q.answer.every(a => ua.includes(a));
        } else {
          isCorrect = userAnswer === q.answer;
        }
      }

      const icon = userAnswer === undefined ? '−' : (isCorrect ? '✓' : '✗');
      const cls = userAnswer === undefined ? 'skipped' : (isCorrect ? 'correct' : 'wrong');

      html += `
        <div class="quiz-result-item ${cls}" data-index="${i}">
          <span class="quiz-result-icon">${icon}</span>
          <span class="quiz-result-text">問${i + 1}</span>
        </div>
      `;
    });

    html += `
        </div>
        <button class="quiz-btn quiz-retry">もう一度挑戦</button>
      </div>
    `;

    this.container.innerHTML = html;

    this.container.querySelectorAll('.quiz-result-item').forEach(item => {
      item.addEventListener('click', () => {
        this.currentIndex = parseInt(item.dataset.index);
        this.render();
      });
    });

    this.container.querySelector('.quiz-retry').addEventListener('click', () => {
      this.answers = {};
      this.currentIndex = 0;
      this.render();
    });
  }
}
