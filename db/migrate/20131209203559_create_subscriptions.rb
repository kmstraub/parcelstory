class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.belongs_to :user
      t.belongs_to :parcel

      t.timestamps
    end
    add_index :subscriptions, :user_id
    add_index :subscriptions, :parcel_id
  end
end
