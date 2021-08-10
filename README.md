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
- has_many :image_orders
- has_many :orders, through: :image_orders
- has_many :image_tag_relations
- has_many :tags, through: :image_tag_relations
- has_many :line_items
- has_many :carts, through: :line_items
- has_many :calendar, through: :image_orders


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

## Image_ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| image  | references | null: false, foreign_key: true |
| order  | references | null: false, foreign_key: true |
| cart   | references | null: false, foreign_key: true |

### Associations
- belongs_to :image
- belongs_to :order
- belongs_to :cart
- belongs_to :calendar


## Ordersテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |

### Associations
- belongs_to :user
- has_many :image_orders
- has_many :images, through: :image_orders
- has_one :mailing
- has_one :calendar

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
- belongs_to :calender, through: :line_item

## calendarsテーブル
| Column   | Type       | Options                        |
| -------- | ---------- | ------------------------------ |
| month    | integer    | null: false                    |
| image    | references | null: false, foreign_key: true |
| cart     | references | null: false, foreign_key: true |

### Associations
- belongs_to :image_order
- belongs_to :cart, through: :image_order
- has_many :images, through: :image_order
- belongs_to :order