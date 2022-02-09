require 'rails_helper'

RSpec.feature "Visitor navigates to Product Details page", type: :feature, js: true do

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

  scenario "They see a specific product when clicked on" do
    # ACT
    visit root_path
    find_link('Details »', match: :first).click
    puts page.html

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_content('Description')
  end
end
