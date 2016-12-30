class User < ApplicationRecord

validates :email, presence: true
validates :name, presence: true
validates :password, presence: true



  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :messages
  has_many :group_users
  has_many :groups, through: :group_users
end
