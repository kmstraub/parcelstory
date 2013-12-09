class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
    	t.date :when
    	t.text :body
    	t.string :source
    	t.integer :parcel_id
    	t.integer :user_id
    		

      t.timestamps
    end
  end
end
