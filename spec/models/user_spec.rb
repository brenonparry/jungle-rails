require 'rails_helper'

RSpec.describe User, type: :model do
  
  describe 'Validations' do


    it "will save new user when all feild are set correclty" do
    
      @user = User.create({ name: "Lloyd Christmas" , email: "lloyd_christmas@DD.com", password: "123456", password_confirmation: "123456" })
      @user.save
      expect(User.find_by(name: "Lloyd Christmas")).not_to be_nil
    
    end

    it "will NOT save new user when password and confirmation dont match" do

      @user = User.create({ name: "Lloyd Christmas" , email: "lloyd_christmas@DD.com", password: "123456", password_confirmation: "123456" })
      @user.password = "123456"
      @user.password_confirmation = "654321"
      @user.save
      expect(@user.password).not_to eq(@user.password_confirmation)

    end

    it "will NOT save new user when password and confirmation are nil" do

      @user = User.create({ name: "Lloyd Christmas" , email: "lloyd_christmas@DD.com", password: nil , password_confirmation: nil })
      @user.save
      expect(@user).to_not be_valid
    end

    it "will NOT save new user when name is nil" do

      @user = User.create({ name: nil , email: "lloyd_christmas@DD.com", password: "123456" , password_confirmation: "123456" })
      @user.save
      expect(@user).to_not be_valid

    end

    it "will NOT save new user when email is nil" do

      @user = User.create({ name: "Lloyd Christmas" , email: nil, password: "123456" , password_confirmation: "123456" })
      @user.save
      expect(@user).to_not be_valid
      
    end

    it "will NOT save new user when password is not long enough" do

      @user = User.create({ name: "Lloyd Christmas" , email: "lloyd_christmas@DD.com", password: "12" , password_confirmation: "12" })
      @user.save
      expect(@user).to_not be_valid
      
    end

    it "will NOT save new user when email is in use by an existing user" do

      @user = User.create({ name: "Lloyd Christmas" , email: "lloyd_christmas@DD.com", password: "123456" , password_confirmation: "123456" })
      @user.save
      @user2 = User.create({ name: "Harry Dunn" , email: "lloyd_christmas@DD.com", password: "123456" , password_confirmation: "123456" })
      @user.save
      expect(@user2).to_not be_valid

    end


    describe '.authenticate_with_credentials' do
      # examples for this class method here
    end
  




  end

end
