class AddDataToOccurence < ActiveRecord::Migration[5.1]
  def change
    add_column :occurrences, :date_end, :datetime
  end
end
