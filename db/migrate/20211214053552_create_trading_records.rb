class CreateTradingRecords < ActiveRecord::Migration[6.0]
  def change
    create_table :trading_records do |t|
      t.timestamps
      t.references :user,        null: false, foreign_key: true
      t.references :item,        null: false, foreign_key: true
    end
  end
end
