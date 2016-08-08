class AddTracks < ActiveRecord::Migration
  def change
    create_table :tracks do |t|
      t.string :title
      t.string :author
      t.string :url 
      t.date :created_at
      t.date :updated_at
    end 
  end
end
