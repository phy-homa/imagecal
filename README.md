# アプリ名
Imagecal

# 概要
ユーザーは画像（イラスト・写真）の投稿ができます。投稿された画像を12枚選び、カレンダーをどの画像を何月に設定するかカスタマイズできます。カスタマイズしたカレンダーはクレジット購入できます。

# 本番環境
## デプロイ先
- https://imagecal.herokuapp.com/

## テストアカウント
- email: test2@test.com
- password: test222

# 制作背景（意図）
現代、自分で好きなものを選べる時代になってきたと思います。例えば、昔は観たい時についているテレビ番組を観ますが、現在は自分でyoutubeで好きな動画だけ選んで観ます。時代に合わせて、流行に敏感な若い20代・30代の方をターゲットに自分で何かをカスタマイズできるサービスを作りたいと考えました。
カスタマイズできるサービスとして、二点の理由から、今回は絵の部分をカスタマイズしたカレンダーを購入できるアプリにしました。
一つ目の理由は、カレンダーが実用的だからです。カレンダー自体は自分の予定を記録したり、他の人と予定の共有ができる便利な道具です。カレンダーを購入できるアプリであれば、ニーズがあるのではないかと思いました。
もう一つの理由は、カスタマイズするメリットがあるからです。カレンダーは、絵と日程表がセットになり完成された状態で売られていることが一般的です。既製品のカレンダーは、同一のシリーズで作成されていたり、選ばれたさまざまな作者の絵をまとめて作成されています。カレンダーの絵をカスタマイズできれば、自分の好きな作者の好きな絵だけを選ぶことができ、面白いものができるのではないかと考えました。

# DEMO

# 工夫したポイント

# 使用技術（開発環境）
Ruby 2.6.5
Ruby on Rails 6.0.0
HTML
Javascript
MySQL2 0.4.4


# 課題や今後実装したい機能


# DB設計

## Usersテーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| firstname | string | null: false |
| lastname  | string | null: false |
| email     | string | null: false |
| encrypted | string | null; false |
| introduce | text   |             |

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
- has_many :image_tag_relations
- has_many :tags, through: :image_tag_relations, dependent: :destroy
- has_many :line_items
- has_many :carts, through: :line_items
- has_many :image_calendars
- has_many :calendar, through: ：line_items


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
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

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
| Column  | Type    | Options     |
| ------- | ------- | ----------- |
| month1  | integer | null: false |
| img1    | integer | null: false |
| month2  | integer | null: false |
| img2    | integer | null: false |
| month3  | integer | null: false |
| img3    | integer | null: false |
| month4  | integer | null: false |
| img4    | integer | null: false |
| month5  | integer | null: false |
| img5    | integer | null: false |
| month6  | integer | null: false |
| img6    | integer | null: false |
| month7  | integer | null: false |
| img7    | integer | null: false |
| month8  | integer | null: false |
| img8    | integer | null: false |
| month9  | integer | null: false |
| img9    | integer | null: false |
| month10 | integer | null: false |
| img10   | integer | null: false |
| month11 | integer | null: false |
| img11   | integer | null: false |
| month12 | integer | null: false |
| img12   | integer | null: false |

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