usersテーブル

|Column             |Type   | Options                | 
|                   |       |                        |
|nickname           |string |null:false              |
|email              |string |null:false, unique:true |
|encrypted_password |string |null:false              |
|first_name         |string |null:false              |
|last_name          |string |null:false              |
|birth_year         |string |null:false              |
|birth_month        |string |null:false              |
|birth_day          |string |null:false              |

has_many :items
has_many :orders


itemsテーブル

|Column           |Type       | Options                      | 
|                 |           |                              |
|item_name        |string     |null:false                    |
|detail           |text       |null:false                    |
|category         |string     |null:false                    |
|status           |string     |null:false                    |
|shipping_burden  |string     |null:false                    |
|shipment_source  |string     |null:false                    |
|price            |string     |null:false                    |
|user_id          |references |null:false, foreign_key: true |

belongs_to :users
has_one :orders


ordersテーブル

|Column         |Type       | Options                      | 
|               |           |                              |
|postal_code    |string     |null:false                    |
|prefectures    |string     |null:false                    |
|municipalities |string     |null:false                    |
|address        |string     |null:false                    |
|building_name  |string     |null:false                    |
|phone_number   |string     |null:false                    |
|item_id        |references |null:false, foreign_key: true |
|user_id        |references |null:false, foreign_key: true |

belongs_to :users
belongs_to :items
