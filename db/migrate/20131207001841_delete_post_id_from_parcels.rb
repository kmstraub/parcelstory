class DeletePostIdFromParcels < ActiveRecord::Migration
  def change
  	remove_column :parcels, :post_id
  end
end
