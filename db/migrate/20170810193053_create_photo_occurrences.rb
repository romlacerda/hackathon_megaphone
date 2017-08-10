class CreatePhotoOccurrences < ActiveRecord::Migration[5.1]
  def change
    create_table :photo_occurrences do |t|
      t.attchment :photo
      t.references :occurrence, foreign_key: true

      t.timestamps
    end
  end
end
