class AddUserToOccurence < ActiveRecord::Migration[5.1]
  def change
    add_reference :occurrences, :user, foreign_key: true
  end
end
