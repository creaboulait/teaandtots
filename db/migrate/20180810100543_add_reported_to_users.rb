class AddReportedToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :reported, :boolean, default: false
  	add_column :users, :reported_by_user_id, :integer
  end
end
