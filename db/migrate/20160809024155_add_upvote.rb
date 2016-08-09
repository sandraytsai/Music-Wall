class AddUpvote < ActiveRecord::Migration
  def change
    create_table :upvotes do |v|
      v.integer :upvotes, default: 0
      v.integer :user_id
      v.integer :track_id
    end
  end
end
