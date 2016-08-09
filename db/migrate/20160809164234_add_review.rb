class AddReview < ActiveRecord::Migration
  def change
    create_table :reviews do |r|
      r.string :title
      r.string :body
      r.integer :rating
      r.integer :user_id
      r.integer :track_id
      r.date :created_at
    end
  end
end


