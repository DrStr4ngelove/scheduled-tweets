class CreateUsers < ActiveRecord::Migration[7.2]
  def change
    create_table :users do |t|
      t.string :email, null: false
      t.string :password_digest
      t.string :username, null: false
      t.timestamps
      t.likes
      t.posts
      t.comments
    end
  end
end
