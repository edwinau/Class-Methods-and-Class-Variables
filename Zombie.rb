class Zombie

  attr_reader :horde, :max_speed, :max_strength, :default_speed, :default_strength
  attr_accessor :plague_level

  @@horde = [] #collection of zombies
  @@plague_level = 10

  @@max_speed = 5 #never changes
  @@default_speed = 1 #never changes

  @@max_strength = 8 #never changes
  @@default_strength = 3 #never changes

  def initialize(d=rand(1..5),h=rand(1..8))
      @max_speed = d
      @max_strength = h
      if d > @@max_speed
        @max_speed = @@default_speed
      end
      if h > @@max_strength
        @max_strength = @@default_strength
      end
      # puts "#{@max_speed}"
      # puts "#{@max_strength}"
  end

  def encounter
    if outrun_zombie? == true
      puts "You ran faster than zombie, survived!"
    elsif survive_attack? == true
      puts "You are stronger than zombie, you caught plague!"
      @@horde << Zombie.new
    else
      puts "You died!"
    end
  end

  def outrun_zombie?
    how_fast = rand(1..@@max_speed)
    if how_fast > @max_speed
      return true
    else
      return false
    end
  end

  def survive_attack?
    how_strong = rand(1..@@max_strength)
    if how_strong > @max_strength
      return true
    else
      return false
    end
  end

  def self.all
    return @@horde
  end

  def self.new_day
    some_die_off
    spawn
    increase_plague_level
  end

  def self.some_die_off
    if @@horde.length > 0
      num = rand(0..10)
      @@horde.pop(num)
      puts "#{num} zombies died."
    end
  end

  def self.spawn
    num = rand(1..@@plague_level)
    num.times do
      @@horde << Zombie.new(rand(1..@@max_speed),rand(1..@@max_strength))
    end
    puts "Creating #{num} zombies."
  end

  def self.increase_plague_level
    @@plague_level += rand(0..2)
    puts "#{@@plague_level} is the plague level."
  end
end
