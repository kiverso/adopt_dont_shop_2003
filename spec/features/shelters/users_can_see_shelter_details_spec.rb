require 'rails_helper'

RSpec.describe "Shelter show page", type: :feature do
    it "can see shelter details" do
        shelter_1 = Shelter.create( name:    "4 Paws Rescue",
                                    address: "6567 W Long Dr.",
                                    city:    "Littleton",
                                    state:   "CO",
                                    zip:     "80123")
        shelter_2 = Shelter.create( name:    "Dumb Friends League",
                                    address: "6267 W Field St.",
                                    city:    "Denver",
                                    state:   "CO",
                                    zip:     "80127")
        visit "/shelters/#{shelter_1.id}"

        expect(page).to have_content(shelter_1.name)
        expect(page).to have_content(shelter_1.address)
        expect(page).to have_content(shelter_1.city)
        expect(page).to have_content(shelter_1.state)
        expect(page).to have_content(shelter_1.zip)
    end
    
    it "has a link to their pets" do
        shelter_1 = Shelter.create( name:    "4 Paws Rescue",
                            address: "6567 W Long Dr.",
                            city:    "Littleton",
                            state:   "CO",
                            zip:     "80123")
        
        visit "/shelters/#{shelter_1.id}"
        click_link "View Pets"      
        expect(current_path).to eq("/shelters/#{shelter_1.id}/pets")

        click_link "Pets"
        expect(current_path).to eq("/pets")

        click_link "Shelters"
        expect(current_path).to eq("/shelters")
    end
end