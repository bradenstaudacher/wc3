require_relative 'spec_helper'

#Aside from gold and food, there is also the concept of lumber. 
#Add lumber as a resource that the barracks can handle.
#A Barracks can start off with 500 lumber.

describe Barracks do 

  before :each do
    @barracks = Barracks.new
  end

  describe "#new" do
    it "should create a barracks that has 500 lumber as an instance variable" do
      expect(@barracks.lumber).to eq(500)
    end
  end

  describe "#lumber" do
    it "should be able to set instance variable lumber to a new value" do
      @barracks.lumber = 300
      expect(@barracks.lumber).to eq(300)
    end
  end

end