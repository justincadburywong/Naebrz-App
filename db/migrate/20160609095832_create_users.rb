class CreateUsers < ActiveRecord::Migration
  def change
  	create_table :users do |t|
  		t.string :first_name
  		t.string :last_name
  		t.string :password_hash
  		t.string :email
  		t.string :street
  		t.string :city
  		t.string :state
  		t.string :postcode

 			t.timestamps null: false
  	end
  end
end
