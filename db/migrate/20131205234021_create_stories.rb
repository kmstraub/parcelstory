class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.text :body
      t.string :story_type
      t.string :source
      t.references :user, index: true
      t.references :book, index: true
      t.references :parcel, index: true

      t.timestamps
    end
  end
end
