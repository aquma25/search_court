class AddTimeAndStationToPlayGround < ActiveRecord::Migration[5.2]
  def change
    add_column :play_grounds, :nearest_station, :string
    add_column :play_grounds, :start_time, :time
    add_column :play_grounds, :end_time, :time
  end
end
