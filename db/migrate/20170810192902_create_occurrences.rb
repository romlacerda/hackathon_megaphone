class CreateOccurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :occurrences do |t|
      t.datetime :data_begin
      t.string :status
      t.text :description

      t.timestamps
    end
  end
end
