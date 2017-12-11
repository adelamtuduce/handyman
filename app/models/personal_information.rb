class PersonalInformation < ApplicationRecord
    geocoded_by :full_street_address   # can also be an IP address
    after_validation :geocode          # auto-fetch coordinates

    belongs_to :user

    def full_street_address
        [city, street, number.to_s + building, county, country].compact.join(", ")
    end

    def address
        [city, street, number.to_s + building, apartment, county, country].compact.join(", ")
    end

end
