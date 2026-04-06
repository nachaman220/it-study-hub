INSERT INTO public.content_pages (section_id, chapter, section_order, title, slug, content_html, is_free) VALUES ('4.3', 4, 3, 'ネットワーク', 'network', '<h1>4.6 ネットワークソリューション</h1>

      <!-- ==================== VNet ==================== -->
      <h2 id="vnet">Azure Virtual Network（VNet）</h2>
      <p>VNet は Azure 上のプライベートネットワークの基盤。リソースをサブネットに配置し、ネットワークレベルの分離とセキュリティを提供する。VNet は<strong>リージョンごと</strong>に作成され、リージョンをまたぐことはできない（VNet ピアリングで接続は可能）。</p>

      <h3>インターネット接続</h3>
      <p>VNet 内のリソースからインターネットへの接続（送信/受信）は、以下の方法で実現する。</p>

      <h3>送信（アウトバウンド）</h3>
      <ul>
        <li><strong>既定の送信アクセス</strong> — VNet 内の VM は既定でインターネットへの送信が可能（Azure が動的に IP を割り当て）</li>
        <li><strong>NAT Gateway</strong> — サブネットに関連付けて固定のパブリック IP で送信接続を行う。送信元 IP を固定したい場合に利用</li>
      </ul>

      <h3>受信（インバウンド）</h3>
      <ul>
        <li><strong>パブリック IP</strong> — リソースに直接パブリック IP を割り当て</li>
        <li><strong>Load Balancer</strong> — レイヤー 4 の負荷分散で受信トラフィックを複数の VM に分散</li>
        <li><strong>Application Gateway</strong> — レイヤー 7 の負荷分散。URL パスベースのルーティング、SSL ターミネーション、WAF 統合が可能</li>
      </ul>

      <!-- ==================== オンプレミス接続 ==================== -->
      <h2 id="on-premises-connectivity">オンプレミス接続</h2>

      <h3>VPN Gateway</h3>
      <p>暗号化されたトンネルを介してオンプレミスネットワークと Azure VNet を接続する。</p>
      <ul>
        <li><strong>サイト間（S2S）VPN</strong> — オンプレミスの VPN デバイスと Azure VPN Gateway を IPsec/IKE トンネルで接続。拠点間の常時接続に利用</li>
        <li><strong>ポイント対サイト（P2S）VPN</strong> — 個々のクライアント端末から Azure VNet に接続。OpenVPN、IKEv2、SSTP プロトコルに対応。リモートワーカー向け</li>
      </ul>

      <h3>ExpressRoute</h3>
      <p>接続プロバイダーを介した Azure への<strong>プライベート接続</strong>。公衆インターネットを経由しないため、高い信頼性、高速なスループット、低遅延を実現する。ミッションクリティカルなワークロードに最適。</p>

      <h3>ExpressRoute Global Reach</h3>
      <p>複数のオンプレミスデータセンター同士を ExpressRoute 経由で接続する機能。BGP ルーティングを使用し、Azure のバックボーンネットワークを中継してオンプレ DC 間の通信を実現する。</p>

      <h3>Azure Virtual WAN</h3>
      <p>ネットワーク、セキュリティ、ルーティングの機能を単一の運用インターフェースに統合するサービス。仮想ハブを中心に、ブランチ（VPN）、ExpressRoute、VNet を接続する。</p>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>SKU</th>
              <th>対応する接続</th>
              <th>備考</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>Basic</strong></td>
              <td>S2S VPN のみ</td>
              <td>小規模拠点向け</td>
            </tr>
            <tr>
              <td><strong>Standard</strong></td>
              <td>S2S VPN + P2S VPN + ExpressRoute + VNet 間接続</td>
              <td>フル機能</td>
            </tr>
          </tbody>
        </table>
      </div>
      <p>Basic から Standard への<strong>アップグレードは可能</strong>だが、Standard から Basic への<strong>ダウングレードは不可</strong>。</p>

      <h3>セキュリティ保護付き仮想ハブ</h3>
      <p>Virtual WAN のハブに Azure Firewall、NVA（ネットワーク仮想アプライアンス）、またはサードパーティの SaaS セキュリティソリューションを統合したもの。ハブ経由のトラフィックにセキュリティポリシーを適用できる。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「オンプレミスと Azure をプライベートに接続」→ <strong>ExpressRoute</strong></li>
          <li>「オンプレ DC 間を Azure バックボーンで接続」→ <strong>ExpressRoute Global Reach</strong></li>
          <li>「多数の拠点を一元管理」→ <strong>Virtual WAN</strong></li>
          <li>Virtual WAN の Basic は S2S のみ。P2S や ExpressRoute が必要なら Standard</li>
        </ul>
      </div>

      <!-- ==================== Private Link ==================== -->
      <h2 id="private-link">Azure Private Link</h2>
      <p>Azure PaaS サービスへの接続をパブリックインターネットを経由せずに行う仕組み。2 つのアプローチがある。</p>

      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>機能</th>
              <th>サービスエンドポイント</th>
              <th>プライベートエンドポイント</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>仕組み</strong></td>
              <td>サブネットからサービスへのルートを最適化</td>
              <td>VNet 内にプライベート IP を持つ NIC を作成</td>
            </tr>
            <tr>
              <td><strong>コスト</strong></td>
              <td>無料</td>
              <td>有料</td>
            </tr>
            <tr>
              <td><strong>オンプレミスからのアクセス</strong></td>
              <td>不可（VNet 内のみ）</td>
              <td>可能（VPN/ExpressRoute 経由）</td>
            </tr>
            <tr>
              <td><strong>DNS 構成</strong></td>
              <td>ルートテーブルで制御</td>
              <td>プライベート DNS ゾーンを使用</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Azure Monitor Private Link Scope（AMPLS）</h3>
      <p>Azure Monitor のデータ収集・クエリ通信をプライベートエンドポイント経由で行うための仕組み。Log Analytics ワークスペースや Application Insights への接続をプライベートネットワーク内に閉じることができる。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>「オンプレミスから PaaS サービスにプライベートアクセスしたい」→ <strong>プライベートエンドポイント</strong></li>
          <li>「無料でプライベートアクセスしたい（VNet 内のみ）」→ <strong>サービスエンドポイント</strong></li>
        </ul>
      </div>

      <!-- ==================== パフォーマンス ==================== -->
      <h2 id="network-performance">ネットワークパフォーマンスの最適化</h2>

      <h3>高速ネットワーク（AccelNet / SR-IOV）</h3>
      <p>VM のネットワークスタックをバイパスし、NIC から VM に直接データを転送する技術（SR-IOV）。ネットワークレイテンシの大幅な削減とスループットの向上を実現する。対応する VM サイズで利用可能。</p>

      <h3>Receive Side Scaling（RSS）</h3>
      <p>受信ネットワークトラフィックを複数の CPU コアに分散して処理する技術。マルチコア VM でのネットワーク処理の並列化を可能にする。</p>

      <h3>近接配置グループ</h3>
      <p>複数の VM を同じデータセンター内に物理的に近接して配置する論理的なグループ。VM 間のネットワークレイテンシを最小化する。HPC やリアルタイム処理など、低レイテンシが重要なシナリオに使用する。</p>

      <!-- ==================== セキュリティ ==================== -->
      <h2 id="network-security">ネットワークセキュリティ</h2>

      <h3>多層防御の考え方</h3>
      <p>ネットワークセキュリティは多層防御（Defense in Depth）の原則に基づいて設計する。</p>
      <ul>
        <li><strong>エッジ層</strong> — DDoS Protection と WAF でインターネットからの攻撃を防御</li>
        <li><strong>内部層</strong> — NSG と Azure Firewall でネットワーク内部のトラフィックを制御</li>
      </ul>

      <h3>Azure DDoS Protection</h3>
      <div class="table-wrapper">
        <table>
          <thead>
            <tr>
              <th>プラン</th>
              <th>説明</th>
            </tr>
          </thead>
          <tbody>
            <tr>
              <td><strong>IP 保護</strong></td>
              <td>個別のパブリック IP に対する保護。小規模な環境向け</td>
            </tr>
            <tr>
              <td><strong>VNet 保護</strong></td>
              <td>VNet 全体を保護。テレメトリ、アラート、コスト保証などの追加機能を提供</td>
            </tr>
          </tbody>
        </table>
      </div>

      <h3>Web Application Firewall（WAF）</h3>
      <p>Web アプリケーションを SQL インジェクションや XSS などの一般的な攻撃から保護するファイアウォール。以下のサービスと統合して利用する。</p>
      <ul>
        <li><strong>Application Gateway</strong> — リージョン内の Web アプリ保護</li>
        <li><strong>Azure Front Door</strong> — グローバルなエッジでの Web アプリ保護</li>
        <li><strong>Azure CDN</strong> — CDN エッジでのコンテンツ保護</li>
      </ul>

      <h3>ネットワークセキュリティグループ（NSG）</h3>
      <p>サブネットまたは NIC に関連付けるステートフルなパケットフィルター。送信元/宛先の IP、ポート、プロトコルに基づいてトラフィックを許可/拒否するルールを定義する。</p>

      <h3>Azure Firewall</h3>
      <p>フルマネージドなクラウドネイティブのネットワークファイアウォール。L3-L7 のフィルタリング、FQDN フィルタリング、脅威インテリジェンスベースのフィルタリングを提供する。</p>
      <ul>
        <li><strong>ルールコレクション</strong>からファイアウォール<strong>ポリシー</strong>への移行が推奨されている</li>
        <li>ポリシーは<strong>親ポリシー/子ポリシー</strong>の階層構造を持てる（グローバルルールを親に定義し、リージョンごとのルールを子で上書き）</li>
        <li>ファイアウォールポリシーは<strong>リージョン間で共有できない</strong>（各リージョンに個別のポリシーが必要）</li>
      </ul>

      <h3>Azure Firewall Manager</h3>
      <p>複数の Azure Firewall インスタンスのセキュリティポリシーを一元管理するサービス。グローバルポリシーを定義し、各ハブやリージョンのファイアウォールに適用できる。セキュリティ保護付き仮想ハブとも統合される。</p>

      <div class="info-box exam-tip">
        <div class="info-box-title">試験ポイント</div>
        <ul>
          <li>NSG は<strong>サブネット/NIC レベル</strong>のフィルタリング。Azure Firewall は<strong>VNet レベル</strong>の集中管理型ファイアウォール</li>
          <li>「FQDN ベースのフィルタリング」「脅威インテリジェンス」→ <strong>Azure Firewall</strong></li>
          <li>「NSG のルールが正しく適用されているか確認したい」→ <strong>Network Watcher の IP フロー検証</strong></li>
          <li>ファイアウォールポリシーはリージョン共有不可。リージョンごとにポリシーを作成する</li>
        </ul>
      </div>

      <!-- ==================== 判断フロー ==================== -->
      <h2 id="decision-flow-network">判断フロー：ネットワークソリューションの選択</h2>

      <div class="info-box note">
        <div class="info-box-title">要件 → 選択</div>
        <ol>
          <li>オンプレミスと暗号化接続（コスト重視） → <strong>VPN Gateway（S2S）</strong></li>
          <li>リモートユーザーから VNet へ接続 → <strong>VPN Gateway（P2S）</strong></li>
          <li>オンプレミスと高信頼/高速なプライベート接続 → <strong>ExpressRoute</strong></li>
          <li>オンプレ DC 間を Azure 経由で接続 → <strong>ExpressRoute Global Reach</strong></li>
          <li>多数のブランチ拠点を一元管理 → <strong>Virtual WAN</strong></li>
          <li>PaaS サービスにプライベートアクセス（VNet 内のみ） → <strong>サービスエンドポイント</strong></li>
          <li>PaaS サービスにプライベートアクセス（オンプレミスからも） → <strong>プライベートエンドポイント</strong></li>
          <li>送信 IP を固定したい → <strong>NAT Gateway</strong></li>
          <li>L7 負荷分散 + WAF → <strong>Application Gateway</strong></li>
          <li>サブネット/NIC のトラフィック制御 → <strong>NSG</strong></li>
          <li>集中型のネットワークセキュリティ → <strong>Azure Firewall</strong></li>
          <li>DDoS 攻撃対策 → <strong>DDoS Protection</strong></li>
          <li>VM 間の低レイテンシ → <strong>近接配置グループ + 高速ネットワーク</strong></li>
        </ol>
      </div>

      <!-- ==================== 出典 ==================== -->
      <div class="sources">
        <h3>出典</h3>
        <ul>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-network/virtual-networks-overview" target="_blank">MS Learn: Azure Virtual Network</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/vpn-gateway/vpn-gateway-about-vpngateways" target="_blank">MS Learn: VPN Gateway</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/expressroute/expressroute-introduction" target="_blank">MS Learn: ExpressRoute</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-wan/virtual-wan-about" target="_blank">MS Learn: Virtual WAN</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/private-link/private-link-overview" target="_blank">MS Learn: Azure Private Link</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/virtual-network/accelerated-networking-overview" target="_blank">MS Learn: 高速ネットワーク</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/ddos-protection/ddos-protection-overview" target="_blank">MS Learn: DDoS Protection</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/web-application-firewall/overview" target="_blank">MS Learn: WAF</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/firewall/overview" target="_blank">MS Learn: Azure Firewall</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/firewall-manager/overview" target="_blank">MS Learn: Firewall Manager</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/network-watcher/network-watcher-monitoring-overview" target="_blank">MS Learn: Network Watcher</a></li>
          <li><a href="https://learn.microsoft.com/ja-jp/azure/azure-monitor/logs/private-link-security" target="_blank">MS Learn: AMPLS</a></li>
        </ul>
      </div>

      <!-- ==================== ナビゲーション ==================== -->', false) ON CONFLICT (section_id) DO UPDATE SET content_html = EXCLUDED.content_html, title = EXCLUDED.title, is_free = EXCLUDED.is_free, updated_at = now();