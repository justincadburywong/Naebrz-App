class CreateGatherings < ActiveRecord::Migration
  def change
  	create_table :gatherings do |t|
  		t.integer :event_id
  		t.integer :guest_id
  	end
  end
end
