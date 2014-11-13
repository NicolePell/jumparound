class ChangeDateFormatInMyTable < ActiveRecord::Migration
  def up
    change_column :my_table, :my_column, :date
  end

  def down
    change_column :my_table, :my_column, :datetime
  end
end
