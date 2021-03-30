# テーブル設計

## users テーブル

|   Column              |   Type    |  Option       |
|   ------------------  |  -------  |  -----------  |
|   nickname            |   string  |  null: false  |
|   email               |   string  |  unique: true |
|   encrypted_password  |   string  |  null: false  |
|   last_name           |   string  |  null: false  |
|   first_name          |   string  |  null: false  |
|   last_name_kana      |   string  |  null: false  |
|   last_name_kana      |   string  |  null: false  |
|   birthday            |   date    |  null: false  |

### Association
- has_many :items
- has_many :buys
- has_one :history



## items テーブル

|   Column      |   Type        |  Option       |
|   ----------  |   ----------  |  -----------  |
|   title       |   string      |  null: false  |
|   text        |   text        |  null: false  |
|   category    |   string      |  null: false  |
|   status      |   string      |  null: false  |
|   image       |               |               |
|   fee_burden  |   string      |  null: false  |
|   ship_from   |   string      |  null: false  |
|   ship_date   |   string      |  null: false  |
|   price       |   string      |  null: false  |
|   user        |   references  |               |

### Association
- belongs_to :user
- has_one :buy
- has_one :history



## buys テーブル

|   Column           |  Type        |  Option       |
|  ----------------  |  ----------  |  -----------  |
|   postcode         |  string      |  null: false  |
|   prefecture       |  string      |  null: false  |
|   city             |  string      |  null: false  |
|   block            |  string      |  null: false  |
|   building_name    |  string      |               |
|   phone_number     |  string      |  null: false  |
|   history          |  references  |               |

### Association
- belongs_to :user
- belongs_to :item



## histories テーブル

|   Column           |   Type       |  Option       |
|  ----------------  |  ----------  |  -----------  |
|   user             |  references  |               |
|   item             |  references  |               |

### Association
- belongs_to :user
- belongs_to :item