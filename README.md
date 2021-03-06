# アプリ名
Imagecal

# 概要
ユーザーは画像（イラスト・写真）の投稿ができます。投稿された画像から12枚選び、カレンダーをどの画像を何月に設定するかカスタマイズできます。カスタマイズしたカレンダーはクレジット購入できるようにしました。

# 本番環境
## デプロイ先
- http://35.76.155.128/
- https://imagecal.herokuapp.com/ (SNS認証はherokuのみ実装しています)

## テストアカウント
### ユーザー名：テスト1
- email: test1@test.com
- password: test111

### ユーザー名：テスト2
- email: test2@test.com
- password: test222

# 制作背景（意図）
現在、自分の好みに合わせて作成できるもの（カスタマイズ）が増えてきました。例えば、スターバックスでは、自分の好みに合わせてホイップクリームを増量したりできます。この流行に合わせて、まだカスタマイズが一般的でないものをカスタマイズできるようにするアプリケーションを作成することで、面白く、ニーズのあるものが作れるのではないかと考えました。

カスタマイズできるサービスとして、二点の理由から、今回は絵の部分をカスタマイズしたカレンダーを購入できるアプリにしました。

一つ目の理由は、カレンダーが実用的だからです。カレンダー自体は自分の予定を記録したり、他の人と予定の共有ができる便利な道具です。カレンダーを購入できるアプリであれば、ニーズがあると思いました。

もう一つの理由は、カスタマイズするメリットがあるからです。カレンダーは、絵と日程表がセットになり完成された状態で売られていることが一般的です。既製品のカレンダーは、同一のシリーズで作成されていたり、選ばれたさまざまな作者の絵をまとめて作成されています。カレンダーの絵をカスタマイズできれば、自分の好きな作者の好きな絵だけを選ぶことができ、面白いものができると考えました。

# DEMO
- SNS認証機能
https://gyazo.com/bb7bb505e16fbf5c12f7dc1bb7fb92e4

- ホーム画面 （投稿一覧・タグ検索機能・タブでのシーズンごとの表示）
https://gyazo.com/957c6090ab5e2bbc5fbe327dffda387b

- ユーザー詳細ページ
https://gyazo.com/7ad151e33374de4e3e9397f284bd3372

- 画像の投稿機能
https://gyazo.com/67073ddae26b073b9f411b30a8054a94

- 画像の詳細ページ（SNSシェア機能）
https://gyazo.com/b2a0c4f6583feacab3773d1a0673438b

- カート機能
https://gyazo.com/15679e5e8547ab0830b0993300c04413

- カレンダー作成画面
https://gyazo.com/229089559d2e24854bd7a8355bd538c9

- カレンダープレビュー画面
https://gyazo.com/908b1098c2a9104bc23124fc89c198e7

- 購入機能（Payjp）
https://gyazo.com/9dcb7acfc6251942a11c170defc10638

# 工夫したポイント
工夫した点は３つあります。
- 1点目は、イラストをタグやシーズンごとに表示できるようにしたことです。
タグ別の投稿を確認するためにタグ検索機能を実装しました。また、シーズン別のタブを用意し、シーズン別のイラストを表示できるようにしました。
- 2点目は、SNSの対応させたことです。
このアプリケーションは流行に敏感な20代をターゲットとしているため、多くの20代が利用するSNSと連動できるようにしました。
ユーザーの登録時にSNS認証機能（Facebook・Twitter）、イラストの情報が共有ができるようにSNSのシェア機能（Twitter・Line）を実装しました。
- 3点目は、カレンダーのカスタマイズです。
画像を12枚カートに入れ、選んだ12枚を何月の画像にするのかをプルダウンリストで選べるようにしました。その後、プレビューで1月から順番に日程表がセットになったカレンダーを確認してから、購入できるようにしました。

# 使用技術（開発環境）
Ruby 2.6.5 / 
Ruby on Rails 6.0.0 / 
HTML / 
Javascript / 
MySQL2 0.4.4 / 
Github / 
GithubDesktop / 
rspec-rails 4.0.0 / 
AWS(EC2) / 
unicorn / 
Visual Studio Code / 

# 課題や今後実装したい機能
- 課題は、リファクタリングです。
ビューやモデルで情報量が多い箇所があります。今後は、もっと簡潔にコードが書けないか模索したいと思います。
- 実装したい機能の１つ目は、いいね機能です。
イラストに対して評価ができるようにしたいです。
- 実装したい機能の２つ目は、ユーザーフォロー機能です。
ユーザーをフォローすることによって、そのユーザーが新投稿をした際に通知を受けられるようにしたいです。
- 実装したい機能の３つ目は、ランキングの表示です。
実際に購入されるカレンダーに多く使われる画像、またはいいね機能で多くいいねされている画像がわかるようにしたいです。


# DB設計

## Usersテーブル
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| firstname          | string | null: false |
| lastname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null; false |
| introduce          | text   |             |

### Associations
- has_many :images
- has_one :sns_credentials
- has_many :orders

## Sns_credentialsテーブル
| Column   | Type       | Options           |
| -------- | ---------- | ----------------- |
| provider | string     |                   |
| uid      | string     |                   |
| user     | references | foreign_key: true |

### Associations
- belongs_to :user, optional: true


## Imagesテーブル
| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| comment   | text    |             |
| season_id | integer | null: false |

### Associations
- belongs_to :user
- has_many :image_tag_relations, dependent: :destroy
- has_many :tags, through: :image_tag_relations, dependent: :destroy
- has_many :line_items, dependent: :destroy
- has_many :carts, through: :line_items, dependent: :destroy
- has_many :image_calendars
- has_many :calendars, through: ：image_calendars


## Tagsテーブル
| Column | Type   | Options                       |
| ------ | ------ | ----------------------------- |
| name   | string | null: false, uniqueness: true |

### Associations
- has_many :image_tag_relations
- has_many :images, through: :image_tag_relations


## Image_tag_relationsテーブル
| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| image   | references | foreign_key: true |
| tag     | references | foreign_key: true |

### Associations
- belongs_to :image
- belongs_to :tag


## Ordersテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| user     | references | null: false, foreign_key: true |
| calendar | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_one :mailing
- belongs_to :calendar

## Mailingsテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| building      | string     |                                |
| tel           | string     | null: false                    |
| order         | references | null: false, foreign_key: true |

### Associations
- belongs_to :order

## line_itemsテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | references | null: false, foreign_key: true |
| cart     | references | null: false, foreign_key: true |

### Associations
- belongs_to :image
- belongs_to :cart

## cartsテーブル

### Associations
- has_many :line_items, dependent: :destroy
- has_many :images, through: :line_items

## calendarsテーブル
| Column     | Type    | Options     |
| ---------- | ------- | ----------- |
| month1_id  | integer | null: false |
| img1       | integer | null: false |
| month2_id  | integer | null: false |
| img2       | integer | null: false |
| month3_id  | integer | null: false |
| img3       | integer | null: false |
| month4_id  | integer | null: false |
| img4       | integer | null: false |
| month5_id  | integer | null: false |
| img5       | integer | null: false |
| month6_id  | integer | null: false |
| img6       | integer | null: false |
| month7_id  | integer | null: false |
| img7       | integer | null: false |
| month8_id  | integer | null: false |
| img8       | integer | null: false |
| month9_id  | integer | null: false |
| img9       | integer | null: false |
| month10_id | integer | null: false |
| img10      | integer | null: false |
| month11_id | integer | null: false |
| img11      | integer | null: false |
| month12_id | integer | null: false |
| img12      | integer | null: false |

### Associations
- has_many :image_calendars
- has_many :images, through: :image_calendars
- has_one :order
- has_many :image_month

## image_calendarsテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| image    | references | null: false, foreign_key: true |
| calendar | references | null: false, foreign_key: true |

### Associations
- belongs_to :image
- belongs_to :calendar

## image_month
| Column | Type    | Options     |
| ------ | ------- | ----------- |
| month  | integer | null: false |
| img    | integer | null: false |

### Associations
- belongs_to :calendar
