class Review < ActiveRecord::Base
  belongs_to :user
  belongs_to :track

  validates :title, presence: true 
  validates :body, presence: true, length: { in: 10..500 }
  validates :rating, presence: true

end 
