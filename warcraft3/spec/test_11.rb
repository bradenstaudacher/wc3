require_relative 'spec_helper'

#In most strategy games, like Warcraft III, buildings can also be attacked by units. 
#Since a barracks is a building, it has substantial more HP (500) To make matters worse, 
#a Footman does only HALF of its AP as damage to a Barracks. This is because they are quite 
#ineffective against buildings.

describe Barracks do 

  before :each do
    @barracks = Barracks.new
  end

  describe "#damage" do
    it "should reduce the barracks's health_points by the attack_power specified" do
      @barracks.damage(10)
      expect(@barracks.health_points).to eq(490) # HP started at 500 but just got hit by 10 (see subject)
    end
  end
end

describe Footman do

  before :each do
    @barracks = Barracks.new
    @footman = Footman.new
  end

  describe "#attack!" do
    it "should deal the appropriate (attack power base/2) damage to the barracks" do
      enemy_unit = @barracks
      enemy_unit.should_receive(:damage).with(5)
      @footman.attack!(enemy_unit)
    end
  end
end