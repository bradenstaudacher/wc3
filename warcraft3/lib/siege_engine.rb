#http://classic.battle.net/war3/human/units/siegeengine.shtml
require_relative "unit"

class Siege_Engine < Unit
attr_accessor :attack_power
  def initialize
    # Need to default the 2 instance variables here
    # Also also give code outside this class access to these variables (via attr_reader, attr_writer or attr_accessor)
    @health_points = 400
    @attack_power = 50
  end
  
  def attack!(enemy)
    if enemy.class == Barracks
      enemy.damage(@attack_power*2)
    elsif enemy.class == Siege_Engine
      enemy.damage(@attack_power)
    else
      return false
    end
  end
  
end
