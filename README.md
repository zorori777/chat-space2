
# Chat-space

## DB作成

### users table(gem devise使用)
| column     | type        |             
|:-----------|------------:|

* アソシエーション
  
  has_many :messages
  
  has_many :groups, through: :group＿users
  
  belongs＿to :groups＿users


### groups table
| column     | type        |              |
|:-----------|------------:|:------------:|
| name       |   string    |  null:fasle  |


* アソシエーション
  
  has＿many :users, through: :group__users
  
  belongs_to :group＿users
  
  has_many :messages


### messages table
| column     | type         |              |
|:-----------|-------------:|:------------:|
| image      |    string    |              |
| body       |    text      |              |
| user_id    |    references|  null:false  |
| group_id   |    references|  null:false  |

* index
 
  user_id  


* アソシエーション
  
  belongs_to :user
  
  belongs_to :group


### group_users
| column     | type        |              |
|:-----------|------------:|:------------:|
| user_id    |  references |  null:fasle  |
| group_id   |  references |  null:false  |



* アソシエーション
  
  has_many :user
  
  has_many :group




