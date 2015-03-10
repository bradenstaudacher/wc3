require_relative 'spec_helper'

#Units start off alive but they die if their HP hits 0 or lower. This is usually a result of receiving damage from combat.
#Implementation: Define a method dead? on the Unit class. 
#We add it to Unit instead of Footman for example b/c all units can die, not just footman or peasants.

describe Unit do 

  before :each do
    @unitdead = Unit.new(0,2)
    @unitalive = Unit.new(2,2)
  end

  describe "#dead?" do
    it "should return true when unit health is 0" do
      expect(@unitdead.dead?).to be_truthy
    end
  end

  describe "#dead?" do
    it "should return false when unit health is > 0" do
      expect(@unitalive.dead?).to be_falsey
    end
  end
end