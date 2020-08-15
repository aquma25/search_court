class CreateCourtMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :court_members do |t|
      t.integer :user_id, null: false
      t.integer :play_ground_id, null: false

      t.timestamps
    end
  end
end
