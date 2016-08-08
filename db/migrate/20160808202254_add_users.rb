class AddUsers < ActiveRecord::Migration
  def change
    create_table :users do |u|
      u.string :name
      u.string :email
      u.string :password
      u.date :created_at
      u.date :updated_at
    end
  end
end
