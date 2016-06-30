class CreateGuests < ActiveRecord::Migration
  def change
  	create_table :guests do |t|
  		t.integer :user_id
  		t.integer :event_id
  	end
  end
end
