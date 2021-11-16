usersテーブル

|Column             |Type   | Options                | 
|                   |       |                        |
|nickname           |string |null:false              |
|email              |string |null:false, unique:true |
|encrypted_password |string |null:false              |
|first_name         |string |null:false              |
|last_name          |string |null:false              |
|first_name_kana    |string |null:false              |
|last_name_kana     |string |null:false              |
|birth_date         |date   |null:false              |

has_many :items
has_many :trading_records


itemsテーブル

|Column              |Type       | Options                      | 
|                    |           |                              |
|item_name           |string     |null:false                    |
|detail              |text       |null:false                    |
|category_id         |integer    |null:false                    |
|status_id           |integer    |null:false                    |
|shipping_burden_id  |integer    |null:false                    |
|prefecture_id       |integer    |null:false                    |
|delivery_day_id    |integer    |null:false                    |
|price               |integer    |null:false                    |
|user                |references |null:false, foreign_key: true |

belongs_to :user
has_one :trading_record


trading_recordsテーブル

|Column         |Type       | Options                      | 
|               |           |                              |
|item           |references |null:false, foreign_key: true |
|user           |references |null:false, foreign_key: true |

belongs_to :user
belongs_to :item
has_one :shipping_address


shipping_addressesテーブル

|Column         |Type       | Options                      | 
|               |           |                              |
|postal_code    |string     |null:false                    |
|prefecture_id  |integer    |null:false                    |
|municipality   |string     |null:false                    |
|address        |string     |null:false                    |
|building_name  |string     |                              |
|phone_number   |string     |null:false                    |
|trading_record |references |null:false, foreign_key: true |

belongs_to :trading_record
