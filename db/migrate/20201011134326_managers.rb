class Managers < ActiveRecord::Migration[5.2]
  def change
	  create_table :managers, primary_key: "login_id" do |t|
		  t.string :username,null:false
		  t.string :password_digest
		  t.boolean :administrator,null:false,default:false
	  end
  end
end
