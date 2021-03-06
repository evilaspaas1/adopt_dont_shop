require 'rails_helper'

describe "Visitors" do
  before :each do
    @shelter1 = Shelter.create(name: "Van's pet shop", address: "3724 tennessee dr", city: "Rockford", state: "Illinois", zip: "61108")
    @shelter2 = Shelter.create(name: "Bovice's pet shop", address: "37 tennessee dr", city: "Rockford", state: "Illinois", zip: "61108")
    @shelter3 = Shelter.create(name: "Jared's pet shop", address: "24 tennessee dr", city: "Rockford", state: "Illinois", zip: "61108")
    @shelter4 = Shelter.create(name: "Old Greg's pet shop", address: "24 rona st", city: "Rockford", state: "Illinois", zip: "61102")
    @pet1 = Pet.create(image: "Bellas-pic", name: "Bella", age: "6", sex: "female", shelter_id: "#{@shelter1.id}", description: "Fun loving dog", status: 0)
    @pet2 = Pet.create(image: "maisys-pic", name: "Maisy", age: "6", sex: "female", shelter_id: "#{@shelter2.id}", description: "Stomache on Legs", status: 0)
    @pet3 = Pet.create(image: "Mr.cats-pic", name: "Mr. Cat", age: "9", sex: "male", shelter_id: "#{@shelter3.id}", description: "Has Russian accent", status: 0)
    @pet4 = Pet.create(image: "franks-pic", name: "Frank", age: "3", sex: "male", shelter_id: "#{@shelter4.id}", description: "It's a snake. does snake things", status: 0)
  end
  describe "when they visit /pets" do
    it "Displays all pets" do

      visit "/pets"

      within ".pets_list" do
        expect(page).to have_content(@pet1.name)
        expect(page).to have_content(@pet2.name)
        expect(page).to have_content(@pet3.name)
        expect(page).to have_content(@pet4.name)
      end
    end
  end

  describe "when they visit shelter_id" do
    it "displays info for one shelter" do

      visit "/shelters/#{@shelter1.id}/pets"

      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.image)
      expect(page).to have_content(@pet1.age)
    end
  end

  describe "can see a single pet" do
    it "displays information for one pet" do

      visit "pets/#{@pet1.id}"

      expect(page).to have_content(@pet1.name)
      expect(page).to have_content(@pet1.image)
      expect(page).to have_content(@pet1.description)
      expect(page).to have_content(@pet1.age)
      expect(page).to have_content(@pet1.sex)
      expect(page).to have_content(@pet1.status)

    end
  end

  describe "Can click link Create Pet" do
    it "lets them create a pet" do

      visit "/shelters/#{@shelter1.id}/pets"

      click_on "Create Pet"
      expect(current_path).to eq("/shelters/#{@shelter1.id}/pets/new")

      fill_in :image, with: "pet-pic"
      fill_in :name, with: "Snowball"
      fill_in :description, with: "Watch your toes"
      fill_in :age, with: "2"
      fill_in :sex, with: "female"

      click_on "Create Pet"

      expect(current_path).to eq("/shelters/#{@shelter1.id}/pets")
      expect(page).to have_content("Snowball")
      expect(page).to have_content("pet-pic")
      expect(page).to have_content("2")
      expect(page).to have_content("female")
    end
  end

  # describe "can" do
  #   it "update a pet" do
  #
  #     visit "/pets/#{@pet1.id}"
  #     click_link "Update Pet"
  #
  #     expect(current_path).to eq("/pets/#{@pet1.id}/edit")
  #
  #     fill_in :image, with: "blah"
  #     fill_in :name, with: "Stan"
  #     fill_in :description, with: "Eminem fan"
  #     fill_in :age, with: "2"
  #     fill_in :sex, with: "male"
  #     click_on "Update Pet"
  #     expect(current_path).to eq("/pets/#{@pet1.id}")
  #     expect(page).to have_content("Stan")
  #     expect(page).to have_content("blah")
  #     expect(page).to have_content("Eminem fan")
  #     expect(page).to have_content("2")
  #     expect(page).to have_content("male")
  #   end
  # end
end
