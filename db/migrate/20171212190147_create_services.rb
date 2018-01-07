class CreateServices < ActiveRecord::Migration[5.1]
  def change
    create_table :services do |t|
      t.string :name
      t.integer :start_price
      t.integer :user_id
      t.string :description
      t.integer :start_time
      t.integer :end_time

      t.timestamps
    end
  end
end
