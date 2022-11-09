class Creature
  attr_accessor :name, :species
  def self.create
    p "A new creature has been created"
  end

  def Creature.death
    p "A creature has died"
  end
end

Creature.create
Creature.death