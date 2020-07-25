class AddUsageFeeUsageWeekToPlayGround < ActiveRecord::Migration[5.2]
  def change
    add_column :play_grounds, :usage_fee, :integer
    add_column :play_grounds, :usage_week, :string
  end
end
