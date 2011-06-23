require 'spec_helper'

describe Room do

  context "attribute" do

    before do
      @room = Room.new
    end

    it "should respond to name" do
      @room.should respond_to(:name)
    end

  end

end
