class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
    	t.belongs_to :kid
    	t.belongs_to :playdate
      t.timestamps
    end
  end
end
