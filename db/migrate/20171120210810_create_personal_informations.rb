class CreatePersonalInformations < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_informations do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :street
      t.integer :number
      t.string :county
      t.string :apartment
      t.string :building
      t.string :city
      t.string :country

      t.timestamps
    end
  end
end
