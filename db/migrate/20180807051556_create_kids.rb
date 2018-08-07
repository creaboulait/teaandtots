class CreateKids < ActiveRecord::Migration[5.2]
  def change
    create_table :kids do |t|

    	t.string :name
    	t.integer :age
    	t.string :gender
    	t.belongs_to :user
      t.timestamps
    end
  end
end
