require 'spec_helper'

describe User do

  context "attributes" do

    before do
      @user = User.new
    end

    it "should respond to first name" do
      @user.should respond_to(:first_name)
    end

    it "should respond to last name" do 
      @user.should respond_to(:last_name)
    end

    it "should respond to email" do
      @user.should respond_to(:email)
    end

    it "should respond to username" do
      @user.should respond_to(:username)
    end

    it "should respond to password" do
      @user.should respond_to(:password)
    end

  end

end
