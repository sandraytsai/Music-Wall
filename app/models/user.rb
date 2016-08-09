class User < ActiveRecord::Base
  has_secure_password

  has_many :tracks
  has_many :upvotes
  has_many :reviews

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..{3}/}
  validates :password, presence:true
end