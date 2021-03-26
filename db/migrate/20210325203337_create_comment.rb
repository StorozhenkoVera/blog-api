class CreateComment < ActiveRecord::Migration[6.1]
    create_table :comments do |t|
      t.string :comment
      t.integer :user_id
      t.integer :article_id
      t.timestamps
  end
end
