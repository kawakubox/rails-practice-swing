class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.references :item, null: false, foreign_key: true
      t.references :buyer, null: false, foreign_key: { to_table: 'users' }

      t.timestamps
    end
  end
end
