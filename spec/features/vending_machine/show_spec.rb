require 'rails_helper'

RSpec.describe 'When a user visits a vending machine show page', type: :feature do
  it 'I see all the snacks in that machine and their price' do
    owner = Owner.create(name: "Sam's Snacks")
    dons  = owner.machines.create(location: "Don's Mixed Drinks")
    chips = Snack.create(name: "Chips", price: 1)
    gum = Snack.create(name: "Gum", price: 2)

    dons.snacks << chips
    dons.snacks << gum

    visit machine_path(dons.id)

    within("#snack-#{chips.id}") do
      expect(page).to have_content("Name: Chips")
      expect(page).to have_content("Price: 1")
    end

    within("#snack-#{gum.id}") do
      expect(page).to have_content("Name: Gum")
      expect(page).to have_content("Price: 2")
    end

  end
end
