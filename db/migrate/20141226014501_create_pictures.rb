class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.references :album, index: true
      t.string :caption
      t.text :description
      t.string :content_type
      t.integer :width
      t.integer :height

      t.timestamps null: false
    end
  end
end
