require 'rails_helper'

RSpec.describe Product, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'Validations' do
    
   it "will save new product when all feild are set correclty" do

    @category = Category.new(name: "Furniture")
    @product = Product.new(name: "Divorced-Dad Futon", price: 199, quantity: 12, category: @category)

    @product.save 
    expect(Product.find_by(name: "Divorced-Dad Futon")).not_to be_nil

   end

   
  end
end
