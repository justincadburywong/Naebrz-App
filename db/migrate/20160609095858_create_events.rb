class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :event_name
  		t.string :location
  		t.date :date
  		t.time :start_time
  		t.time :end_time
  		t.integer :host_id

  		t.timestamps null: false
  	end
  end
end
