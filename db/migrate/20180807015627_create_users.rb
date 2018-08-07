class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

    	t.string :email
    	t.string :password
    	t.string :password_digest
    	t.string :first_name
    	t.string :last_name
    	t.string :profilepic
      t.timestamps
    end
  end
end
