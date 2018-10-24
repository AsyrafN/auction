class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
    	
    	t.string :email, null: false
    	t.string :first_name
    	t.string :last_name
    	t.string :phone_number
    	t.date :birthdate
    	t.string :gender
    	t.string :avatar
    	t.integer :role, default: 0
    	t.boolean :verification, default: false
    	t.string :password_digest

      t.timestamps
    end
  end
end
