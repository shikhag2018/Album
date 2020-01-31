class CreateAlbums < ActiveRecord::Migration[5.1]
  def change
    create_table :albums do |t|
      t.text :name
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
