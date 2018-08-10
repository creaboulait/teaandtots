class RemoveReportedFromReviews < ActiveRecord::Migration[5.2]
  def change
  	remove_column :reviews, :reported, :boolean, default: false
  	remove_column :reviews, :reported_by_user_id, :integer
  end
end
