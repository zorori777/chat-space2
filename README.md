# Chat-space

## DB作成

### users table
| column     | type        |  null    | unique|            
|:-----------|------------:|:--------:|:-----:|
|name        |string       |false     |true   |
|email       |string       |false     |true   |
|password    |string       |false     |       |

* index
   
  name

* アソシエーション
  
  has_many :messages
  
  has_many :groups, through: :group＿users
  
  has_many :groups＿users


### groups table
| column     | type        |   null       |
|:-----------|------------:|:------------:|
| name       |   string    |  fasle       |

* アソシエーション
  
  has＿many :users, through: :group__users
  
  has_many :groups＿users
  
  has_many  :messages


### messages table
| column     | type         |    null      |
|:-----------|-------------:|:------------:|
| image      |    string    |              |
| body       |    text      |              |
| user_id    |    references|  false       |
| group_id   |    references|  false       |



* アソシエーション
  
  belongs_to :user
  
  belongs_to :group


### group_users
| column     | type        |  null        |
|:-----------|------------:|:------------:|
| user_id    |  references |  fasle       |
| group_id   |  references |  false       |



* アソシエーション
  
  belongs_to :user
  
  belongs_to :group




