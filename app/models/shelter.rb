class Shelter < ApplicationRecord
    validates_presence_of :name, :address, :city, :state, :zip
    has_many :pets

    def adoptable_pets
        pets.where(adoption_status: "Adoptable")
    end
end