class AddRecommendedAndStatusToItem < ActiveRecord::Migration[4.2]
  def change
    add_column :items, :status, :integer, after: :description, default: 0
    add_column :items, :recommended, :boolean, after: :status
  end
end
