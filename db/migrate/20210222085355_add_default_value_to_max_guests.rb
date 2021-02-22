class AddDefaultValueToMaxGuests < ActiveRecord::Migration[6.1]
  def change
    change_column_default :events, :max_guest, 1
  end
end
