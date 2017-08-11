class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.char :vote
      t.occurrences :references

      t.timestamps
    end
  end
end
