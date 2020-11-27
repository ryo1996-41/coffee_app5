class AddRoastRegionColumn < ActiveRecord::Migration[6.0]
  def change
    add_column:posts,:roast,:string
    add_column:posts,:region,:string
  end
end
