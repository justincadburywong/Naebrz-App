class CreateEvents < ActiveRecord::Migration
  def change
  	create_table :events do |t|
  		t.string :event_name
  		t.string :street
      t.string :city
      t.string :state
      t.string :postcode
  		t.datetime :start_time
  		t.datetime :end_time
  		t.integer :host_id

  		t.timestamps null: false
  	end
  end
end
