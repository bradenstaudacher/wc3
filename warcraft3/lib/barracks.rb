require_relative "unit"
require_relative "production_hash"
require "pry"

class Barracks < Unit
  attr_accessor :gold, :food, :lumber

  def initialize
    @gold = 1000
    @lumber = 500
    @food = 80
    @health_points = 500
    @attack_power = 0
  end


  # def can_train_footman?
  #   if self.gold < 135
  #     return false
  #   elsif self.food < 2
  #     return false
  #   else
  #     return true
  #   end
  # end
  
  # def train_footman
  #   if can_train_footman? == true
  #     @gold -= 135
  #     @food -= 2
  #     Footman.new
  #   end
  # end

  # def can_train_peasant?
  #   if self.gold < 90
  #     return false
  #   elsif self.food < 5
  #     return false
  #   else
  #     return true
  #   end
  # end
  
  # def train_peasant
  #   if can_train_peasant? == true
  #     @gold -= 90
  #     @food -= 5
  #     Peasant.new
  #   end
  # end

  # def can_train_siege_engine?
  #   if self.gold < 200
  #     return false
  #   elsif self.lumber < 60
  #     return false
  #   elsif self.food < 3
  #     return false
  #   else
  #     return true
  #   end
  # end
  
  # def train_siege_engine
  #   if can_train_siege_engine? == true
  #     @gold -= 200
  #     @food -= 3
  #     @lumber -= 60
  #     Siege_Engine.new
  #   end
  # end
  
  $production_hash.keys.each do |method_name|
    define_method "can_train_#{method_name.downcase}?" do
      if self.gold < $production_hash[method_name][0]
        return false
      elsif self.lumber < $production_hash[method_name][1]
        return false
      elsif self.food < $production_hash[method_name][2]
        return false
      else
        return true
      end
    end
  end

  $production_hash.keys.each do |method_name|
    define_method "train_#{method_name.downcase}" do
      if send("can_train_#{method_name.downcase}") == true
        @gold -= $production_hash[method_name][0]
        @food -= $production_hash[method_name][1]
        @lumber -= $production_hash[method_name][2]
        Object::const_get("method_name").new
      end
    end
  end
end
