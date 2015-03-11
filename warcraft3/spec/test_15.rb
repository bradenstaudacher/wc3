require_relative "spec_helper"



#Introduce a SiegeEngine Unit. The SiegeEngine is very effective against buildings such as the Barracks. 
#It is however ineffective against other units (can't attack them, as though they were dead).

#So unlike with Footman (whose attacks do a fraction of the damage they normally would), 
#the SiegeEngine does 2x the damage against the Barracks

#Also, Siege Engines can attack other siege engines even though they cannot attack any other units 
#(such as Peasants or Footmen)

#Stats:

#AP: 50
#HP: 400
#Cost: 200 gold, 60 lumber, 3 food


describe Siege_Engine do

  before :each do
    @siege_engine = Siege_Engine.new
    @siege_engine2 = Siege_Engine.new
    @barracks = Barracks.new
    @footman = Footman.new
    @peasant = Peasant.new
  end

  describe "#attack!" do
    it "should not attack non-siege engine or barracks units" do
      expect(@siege_engine.attack!(@footman)).to be_falsey
      expect(@siege_engine.attack!(@peasant)).to be_falsey
    end
  end

  describe "#attack!" do
    it "should be able to attack other siege engines and barracks" do
        expect(@siege_engine.attack!(@siege_engine2)).to be_truthy
    end
  end


  describe "#attack!" do
    it "should be" do 
      @siege_engine.attack!(@siege_engine2)
      expect(@siege_engine2.health_points == 350).to be_truthy
    end
  end


  describe "#attack!" do
    it "should do double damage when attacking barracks" do
      enemy_unit = @barracks
      enemy_unit.should_receive(:damage).with(100)
      @siege_engine.attack!(enemy_unit)
    end
  end
end

