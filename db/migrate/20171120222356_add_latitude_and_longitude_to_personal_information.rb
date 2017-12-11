class AddLatitudeAndLongitudeToPersonalInformation < ActiveRecord::Migration[5.1]
  def change
    add_column :personal_informations, :latitude, :float
    add_column :personal_informations, :longitude, :float
  end
end
