class User < ActiveRecord::Base
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..{3}/}
  validates :password, presence:true
end