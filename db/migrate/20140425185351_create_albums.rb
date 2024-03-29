class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string :title, null:false
      t.string :band_id, null: false
      t.boolean :live, null: false, default: false

      t.timestamps
    end

    add_index :albums, :band_id
  end
end
