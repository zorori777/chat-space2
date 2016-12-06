# Chat-space

## DB作成

### users table


| column     | type        |              |
|:-----------|------------:|:------------:|
| name       |   string    |  null:fasle  |
| email      |    string   |  null:false  |
| password   |    string   |  null:false  |

* index
  email
  password

* アソシエーション
  has_many :messages
  has_many :groups, through: :group_users
  has_many :groups_users


### groups table
| column     | type        |              |
|:-----------|------------:|:------------:|
| name       |   string    |  null:fasle  |

* index
  name

* アソシエーション
  has_many :users, through: :group__users
  has_many :group_users
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
  group_id

* アソシエーション
  belongs_to :user
  belongs_to :group


### group_users
| column     | type        |              |
|:-----------|------------:|:------------:|
| user_id    |  references |  null:fasle  |
| group_id   |  references |  null:false  |

* アソシエーション
  belongs_to :user
  belomgs_to :group




