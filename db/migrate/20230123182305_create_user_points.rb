class CreateUserPoints < ActiveRecord::Migration[7.0]
  def change
    create_table :user_points do |t|
      t.references :user, null: false, foreign_key: true
      t.integer :point

      t.timestamps
    end
  end
end
