class CreatePlaydates < ActiveRecord::Migration[5.2]
  def change
    create_table :playdates do |t|

    	t.string :title
    	t.string :description
    	t.string :location
    	t.string :address
    	t.datetime :datetime
    	t.belongs_to :user
      t.timestamps
    end
  end
end
