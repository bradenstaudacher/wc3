class Unit
  attr_reader :health_points
  def initialize(health_points, attack_power)
    @health_points = health_points
    @attack_power = attack_power
  end
  def attack!(enemy)
    if enemy.dead? || self.dead?
      return false
    else
      enemy.damage(@attack_power)
    end
  end
  def damage(damage_amount)
    @health_points -= damage_amount
  end
  def dead?
    true if @health_points <= 0
  end
end