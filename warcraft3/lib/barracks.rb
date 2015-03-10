class Barracks
  attr_accessor :gold, :food

  def initialize
    @gold = 1000
    @food = 80
  end

  def can_train_footman?
    if self.gold < 135
      return false
    elsif self.food < 2
      return false
    else
      return true
    end
  end
  
  def train_footman
    if can_train_footman? == true
      @gold -= 135
      @food -= 2
      Footman.new
    end
  end

  def can_train_peasant?
    if self.gold < 90
      return false
    elsif self.food < 5
      return false
    else
      return true
    end
  end
  
  def train_peasant
    if can_train_peasant? == true
      @gold -= 90
      @food -= 5
      Peasant.new
    end
  end
end
