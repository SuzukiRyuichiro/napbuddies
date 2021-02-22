class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.string :title
      t.string :location
      t.datetime :time
      t.integer :max_guest
      t.references :user, null: false, foreign_key: true
      t.integer :host_spoon, default: 0

      t.timestamps
    end
  end
end
