require_relative 'spec_helper'

#A dead unit cannot attack another unit. Conversely, an alive unit will also not attack another unit that is already dead.

describe Unit do 

  before :each do
    @unitdead = Unit.new(0,2)
    @unitalive = Unit.new(2,2)
  end

  describe "#attack!" do
    it "should not issue attack on dead unit" do
      expect(@unitalive.attack!(@unitdead)).to be_falsey
    end
  end

  describe "#attack!" do
    it "a dead unit should not be able to attack" do
      expect(@unitdead.attack!(@unitalive)).to be_falsey
    end
  end
  
end