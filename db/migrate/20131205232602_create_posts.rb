class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :body
      t.string :source
      t.references :user, index: true, null: false
      t.references :parcel, index: true, null: false

      t.timestamps
    end
  end
end
