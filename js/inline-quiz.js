// Inline Quiz — lightweight quiz component for explanation pages
class InlineQuiz {
  constructor(containerEl, questions) {
    this.container = containerEl;
    this.questions = questions;
    this.answers = {};
    this.buildDOM();
  }

  buildDOM() {
    const count = this.questions.length;

    // Header (always visible)
    const header = document.createElement('div');
    header.className = 'iq-header';
    header.setAttribute('role', 'button');
    header.setAttribute('tabindex', '0');
    header.innerHTML = `
      <span class="iq-icon">▶</span>
      <span class="iq-title">練習問題（${count}問）</span>
    `;
    this.container.appendChild(header);

    // Body (hidden by default)
    const body = document.createElement('div');
    body.className = 'iq-body';
    body.style.display = 'none';
    this.questions.forEach((q, i) => {
      body.appendChild(this.buildQuestion(q, i));
    });
    this.container.appendChild(body);

    // Toggle handler
    header.addEventListener('click', () => this.toggle());
    header.addEventListener('keydown', (e) => {
      if (e.key === 'Enter' || e.key === ' ') { e.preventDefault(); this.toggle(); }
    });

    this.headerEl = header;
    this.bodyEl = body;
  }

  toggle() {
    const isHidden = this.bodyEl.style.display === 'none';
    this.bodyEl.style.display = isHidden ? '' : 'none';
    this.headerEl.querySelector('.iq-icon').textContent = isHidden ? '▼' : '▶';
  }

  buildQuestion(q, index) {
    const isMulti = Array.isArray(q.answer);
    const inputType = isMulti ? 'checkbox' : 'radio';
    const name = `iq-${this.container.id}-${index}`;

    const div = document.createElement('div');
    div.className = 'iq-question';

    // Question text
    const textDiv = document.createElement('div');
    textDiv.className = 'iq-question-text';
    textDiv.innerHTML = `<span class="iq-q-num">Q${index + 1}</span> ${q.question.replace(/\n/g, '<br>')}`;
    if (isMulti) textDiv.innerHTML += ' <span class="iq-multi-hint">（複数選択）</span>';
    div.appendChild(textDiv);

    // Choices
    const choicesDiv = document.createElement('div');
    choicesDiv.className = 'iq-choices';
    q.choices.forEach((choice, ci) => {
      const label = document.createElement('label');
      label.className = 'quiz-choice';
      label.innerHTML = `<input type="${inputType}" name="${name}" value="${ci}"><span>${choice}</span>`;
      choicesDiv.appendChild(label);
    });
    div.appendChild(choicesDiv);

    // Actions
    const actionsDiv = document.createElement('div');
    actionsDiv.className = 'iq-actions';
    const btn = document.createElement('button');
    btn.className = 'quiz-btn iq-check';
    btn.textContent = '回答する';
    btn.addEventListener('click', () => this.checkAnswer(index, div, q));
    actionsDiv.appendChild(btn);
    div.appendChild(actionsDiv);

    return div;
  }

  checkAnswer(index, questionDiv, q) {
    const isMulti = Array.isArray(q.answer);
    const name = `iq-${this.container.id}-${index}`;

    let userAnswer;
    if (isMulti) {
      const checked = questionDiv.querySelectorAll(`input[name="${name}"]:checked`);
      if (checked.length === 0) return;
      userAnswer = Array.from(checked).map(c => parseInt(c.value));
    } else {
      const checked = questionDiv.querySelector(`input[name="${name}"]:checked`);
      if (!checked) return;
      userAnswer = parseInt(checked.value);
    }

    this.answers[index] = userAnswer;

    // Determine correctness
    let isCorrect = false;
    if (isMulti) {
      isCorrect = q.answer.length === userAnswer.length && q.answer.every(a => userAnswer.includes(a));
    } else {
      isCorrect = userAnswer === q.answer;
    }

    // Update question styling
    questionDiv.classList.add(isCorrect ? 'iq-correct' : 'iq-wrong');

    // Disable inputs and show correct/wrong
    const labels = questionDiv.querySelectorAll('.quiz-choice');
    const correctAnswers = isMulti ? q.answer : [q.answer];
    const userAnswers = isMulti ? userAnswer : [userAnswer];
    labels.forEach((label, ci) => {
      const input = label.querySelector('input');
      input.disabled = true;
      if (correctAnswers.includes(ci)) label.classList.add('correct');
      else if (userAnswers.includes(ci)) label.classList.add('wrong');
    });

    // Replace button with explanation
    const actionsDiv = questionDiv.querySelector('.iq-actions');
    const explDiv = document.createElement('div');
    explDiv.className = 'quiz-explanation';
    explDiv.innerHTML = `
      <div class="quiz-explanation-title">${isCorrect ? '✓ 正解' : '✗ 不正解'}</div>
      <p>${q.explanation.replace(/\n/g, '<br>')}</p>
    `;
    actionsDiv.replaceWith(explDiv);

    // Update badge in header
    const answeredCount = Object.keys(this.answers).length;
    let badge = this.headerEl.querySelector('.iq-badge');
    if (!badge) {
      badge = document.createElement('span');
      badge.className = 'iq-badge';
      this.headerEl.appendChild(badge);
    }
    badge.textContent = `${answeredCount}/${this.questions.length} 回答済`;
  }
}

// Auto-initialize: run after content is loaded from Supabase or on DOMContentLoaded
function initInlineQuiz() {
  if (typeof ALL_QUIZ_QUESTIONS === 'undefined') return;

  const mainContent = document.querySelector('.main-content');
  if (!mainContent) return;

  // Skip if already initialized
  if (mainContent.querySelector('.inline-quiz-container')) return;

  const shownIds = new Set();

  mainContent.querySelectorAll('h2[id]').forEach(h2 => {
    const tag = h2.id;
    if (tag.startsWith('decision-flow')) return;

    let matched = ALL_QUIZ_QUESTIONS.filter(q =>
      q.tags && q.tags.includes(tag) && !shownIds.has(q.id)
    );
    if (matched.length === 0) return;

    const MAX_PER_SECTION = 5;
    if (matched.length > MAX_PER_SECTION) {
      for (let i = matched.length - 1; i > 0; i--) {
        const j = Math.floor(Math.random() * (i + 1));
        [matched[i], matched[j]] = [matched[j], matched[i]];
      }
      matched = matched.slice(0, MAX_PER_SECTION);
    }

    matched.forEach(q => shownIds.add(q.id));

    let insertBefore = h2.nextElementSibling;
    while (insertBefore && insertBefore.tagName !== 'H2') {
      insertBefore = insertBefore.nextElementSibling;
    }

    const container = document.createElement('div');
    container.className = 'inline-quiz-container';
    container.id = `iq-${tag}`;

    if (insertBefore) {
      insertBefore.parentNode.insertBefore(container, insertBefore);
    } else {
      mainContent.appendChild(container);
    }

    new InlineQuiz(container, matched);
  });
}
document.addEventListener('DOMContentLoaded', initInlineQuiz);
window.addEventListener('contentLoaded', initInlineQuiz);
