class CreateShopCheckins < ActiveRecord::Migration
  def self.up
    rename_table(:shop_checkin, :shop_checkins)
  end

  def self.down
    rename_table(:shop_checkins, :shop_checkin)
  end
end
