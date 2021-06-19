class AddTotalSumToProjects < ActiveRecord::Migration[6.1]
  def change
    add_column :projects, :total_sum, :integer
  end
end
