class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|

    	t.string :title
    	t.string :description
    	t.integer :stars
    	t.belongs_to :playdate
    	t.belongs_to :user
      t.timestamps
    end
  end
end
