class CreateTags < ActiveRecord::Migration[5.1]
  def change
    create_table :tags do |t|
      t.string :Addtags
      t.integer :photo_id

      t.timestamps
    end
  end
end
