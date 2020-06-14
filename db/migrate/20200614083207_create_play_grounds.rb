class CreatePlayGrounds < ActiveRecord::Migration[5.2]
  def change
    create_table :play_grounds do |t|
      t.string :address
      t.float :latitude
      t.float :longitude
      t.string :court_name
      t.text :content
      t.string :place
      t.string :status
      t.boolean :release
      t.integer :user_id

      t.timestamps
    end
  end
end
