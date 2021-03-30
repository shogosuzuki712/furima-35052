# テーブル設計

## users テーブル

|   Column      |   Type    |  Option       |
|   ----------  |   ------  |  -----------  |
|   nickname    |   string  |  null: false  |
|   email       |   string  |  null: false  |
|   password    |   string  |  null: false  |
|   first_name  |   string  |  null: false  |
|   last_name   |   string  |  null: false  |
|   birthday    |   string  |  null: false  |

### Association
- has_many :items
- has_many :buys



## items テーブル

|   Column      |   Type    |  Option       |
|   ----------  |   ------  |  -----------  |
|   title       |   string  |  null: false  |
|   text        |   text    |  null: false  |
|   category    |   string  |  null: false  |
|   status      |   string  |  null: false  |
|   image       |           |               |
|   user        | references|               |

### Association
- belongs_to :user
- has_one :delivery


## deliveries テーブル

|   Column      |   Type    |  Option       |
|   ----------  |   ------  |  -----------  |
|   postage     |   string  |  null: false  |
|   place       |   text    |  null: false  |
|   days        |   string  |  null: false  |
|   price       |   string  |  null: false  |

### Association
- belongs_to :item



## buys テーブル

|   Column        |   Type    |  Option       |
|   ----------    |   ------  |  -----------  |
|card_information |   string  |  null: false  |
| espiration_date |   string  |  null: false  |
|  security_code  |   string  |  null: false  |
|  postal_code    |   string  |  null: false  |
|   prefecture    |   string  |  null: false  |
|    addless      |   string  |  null: false  |
|  building_name  |   string  |  null: false  |
|  phone_number   |   string  |  null: false  |
|   user          | references|  null: false  |

### Association
- belongs_to :user
