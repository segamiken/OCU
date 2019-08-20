class AddAverageStarToComments < ActiveRecord::Migration[5.2]
  def change
    add_column :comments, :average_star, :integer
  end
end
