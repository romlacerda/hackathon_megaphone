class CreateVotes < ActiveRecord::Migration[5.1]
  def change
    create_table :votes do |t|
      t.boolean :vote
      t.references :occurrence, foreign_key: true

      t.timestamps
    end
  end
end
