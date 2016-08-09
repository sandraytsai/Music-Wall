class User < ActiveRecord::Base
  has_many :tracks
  has_many :upvotes

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /.+@.+\..{3}/}
  validates :password, presence:true
end