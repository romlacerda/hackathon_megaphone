class RenameOccurrencesToOccurence < ActiveRecord::Migration[5.1]
  def change
  	rename_column :votes, :occurrences_id, :occurrence_id
  end
end
