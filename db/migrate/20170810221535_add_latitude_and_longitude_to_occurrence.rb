class AddLatitudeAndLongitudeToOccurrence < ActiveRecord::Migration[5.1]
  def change
    add_column :occurrences, :latitude, :string
    add_column :occurrences, :longitude, :string
  end
end
