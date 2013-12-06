class CreateParcels < ActiveRecord::Migration
  def change
    create_table :parcels do |t|
      t.string :address
      t.string :address_2
      t.string :city
      t.string :state
      t.string :zip
      t.string :neighborhood
      t.string :county
      t.string :name
      t.float :latitude
      t.float :longitude
      t.integer :post_id
      t.integer :user_id
      t.references :user, index: true, null: false
      t.references :post, index: true, null: false

      t.timestamps
    end
  end
end
