# テーブル設計

## users テーブル (ユーザー情報)

|   Column              |   Type    |  Option                     |
|   ------------------  |  -------  |  -------------------------  |
|   nickname            |   string  |  null: false                |
|   email               |   string  |  null: false, unique: true  |
|   encrypted_password  |   string  |  null: false                |
|   last_name           |   string  |  null: false                |
|   first_name          |   string  |  null: false                |
|   last_name_kana      |   string  |  null: false                |
|   last_name_kana      |   string  |  null: false                |
|   birthday            |   date    |  null: false                |

### Association
- has_many :items
- has_many :histories



## items テーブル (商品情報)

|   Column         |   Type         |  Option             |
|   -------------  |   -----------  |  -----------------  |
|   title          |   string       |  null: false        |
|   text           |   text         |  null: false        |
|   category_id    |   integer      |  null: false        |
|   state_id       |   integer      |  null: false        |
|   fee_burden_id  |   integer      |  null: false        |
|   prefecture_id  |   integer      |  null: false        |
|   ship_date_id   |   integer      |  null: false        |
|   price          |   integer      |  null: false        |
|   user           |   references   |  foreign_key: true  |

### Association
- belongs_to :user
- has_one :history



## buys テーブル (住所情報)

|   Column           |  Type        |  Option             |
|  ----------------  |  ----------  |  -----------------  |
|   postcode         |  string      |  null: false        |
|   prefecture_id    |  integer     |  null: false        |
|   city             |  string      |  null: false        |
|   block            |  string      |  null: false        |
|   building_name    |  string      |                     |
|   phone_number     |  string      |  null: false        |
|   history          |  references  |  foreign_key: true  |

### Association
belongs_to :history


## histories テーブル (購入記録)

|   Column           |   Type       |  Option            |
|  ----------------  |  ----------  |  ----------------  | 
|   user             |  references  |  foreign_key: true |
|   item             |  references  |  foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :buy