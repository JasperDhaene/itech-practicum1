class FixDateToDateTime < ActiveRecord::Migration
  def change
    change_column :messages, :date, :datetime
    change_column :events, :startdate, :datetime
    change_column :events, :enddate, :datetime
  end
end
