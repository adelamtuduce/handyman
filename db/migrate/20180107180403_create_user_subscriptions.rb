class CreateUserSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :user_subscriptions do |t|
      t.integer :user_id
      t.integer :service_id

      t.timestamps
    end
  end
end
