require 'rails_helper'

RSpec.feature "AddsToCart", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They see the total number increase for the cart when added to" do
    # ACT
    visit root_path
    expect(page).to have_text 'My Cart (0)'
    click_button('Add', match: :first).click
    puts page.html

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_text 'My Cart (1)'
  end
end
