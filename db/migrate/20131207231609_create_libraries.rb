class CreateLibraries < ActiveRecord::Migration
  def change
    create_table :libraries do |t|
      t.integer :parcel_id
      t.integer :book_id

      t.timestamps
    end
  end
end
