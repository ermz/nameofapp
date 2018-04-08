class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :user_id
      t.string :product_id
      t.text :user_comment
      t.float :rating

      t.timestamps
    end
  end
end
