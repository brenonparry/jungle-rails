require 'rails_helper'

RSpec.describe Product, type: :model do
  
  describe 'Validations' do
    
   it "will save new product when all feild are set correclty" do

    @category = Category.new(name: "Furniture")
    @product = Product.new(name: "Divorced-Dad Futon", price: 199, quantity: 12, category: @category)

    @product.save 
    expect(Product.find_by(name: "Divorced-Dad Futon")).not_to be_nil

   end

   it "will not save new product when name feild is not set correclty" do

    @category = Category.new(name: "Furniture")
    @product = Product.new(name: "Divorced-Dad Futon", price: 199, quantity: 12, category: @category)

    @product.name = nil
    @product.save 
    # puts "++++++++++#{@product.errors.full_messages}"
    expect(@product.errors.full_messages).to include("Name can't be blank")

   end

   it "will not save new product when price feild is not set correclty" do

    @category = Category.new(name: "Furniture")
    @product = Product.new(name: "Divorced-Dad Futon", price: 199, quantity: 12, category: @category)

    @product.price_cents = nil
    @product.save 
    # puts "++++++++++#{@product.errors.full_messages}"
    expect(@product.errors.full_messages).to include("Price is not a number")

   end

   it "will not save new product when quantity feild is not set correclty" do

    @category = Category.new(name: "Furniture")
    @product = Product.new(name: "Divorced-Dad Futon", price: 199, quantity: 12, category: @category)

    @product.quantity = nil
    @product.save 
    # puts "++++++++++#{@product.errors.full_messages}"
    expect(@product.errors.full_messages).to include("Quantity can't be blank")

   end

   it "will not save new product when category feild is not set correclty" do

    @category = Category.new(name: "Furniture")
    @product = Product.new(name: "Divorced-Dad Futon", price: 199, quantity: 12, category: @category)

    @product.category = nil
    @product.save 
    # puts "++++++++++#{@product.errors.full_messages}"
    expect(@product.errors.full_messages).to include("Category can't be blank")

   end

  end
end
