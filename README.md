# DB設計

## Usersテーブル
| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| firstname | string | null: false |
| lastname  | string | null: false |
| email     | string | null: false |
| encrypted | string | null; false |

### Associations
- has_many :images
- has_many :sns_credentials
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
- has_one_attached :picture
- has_many :orders
- has_many :tags, through: :image_tag_relations
- has_many :image_tag_relations
- has_many :line_items
- has_many :carts, through: :line_items


## Tagsテーブル
| Column | Type   | Options                       |
| ------ | ------ | ----------------------------- |
| name   | string | null: false, uniqueness: true |

### Associations
- has_many :images, through: :image_tag_relations
- has_many :image_tag_relations


## Image_tag_relationsテーブル
| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| image   | references | foreign_key: true |
| tag     | references | foreign_key: true |

### Associations
- belongs_to :image
- belongs_to :tag

## Ordersテーブル
| Column  | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| image   | references | foreign_key: true |

### Associations
- belongs_to :user
- belongs_to :image

## Mailingsテーブル
| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| postal_code   | string  | null: false |
| prefecture_id | integer | null: false |
| city          | string  | null: false |
| building      | string  |             |
| tel           | string  | null: false |

### Associations
- has_one :order

## line_itemsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | references | null: false, foreign_key: true |
| cart   | references | null: false, foreign_key: true |

### Associations
- belongs_to :image
- belongs_to :cart