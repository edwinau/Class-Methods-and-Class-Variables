class Zombie

  attr_reader :horde, :max_speed, :max_strength, :default_speed, :default_strength
  attr_accessor :plague_level

  @@horde = [] #collection of zombies
  @@plague_level = 10

  @@max_speed = 5 #never changes
  @@default_speed = 1 #never changes

  @@max_strength = 8 #never changes
  @@default_strength = 3 #never changes

  def initialize(d=0,h=0)
      @max_speed = d
      @max_strength = h
      if d > @@max_speed
        @max_speed = @@default_speed
      end
      if h > @@max_strength
        @max_strength = @@default_strength
      end
      puts "#{@max_speed}"
      puts "#{@max_strength}"
  end

  def encounter
  end

  def outrun_zombie?
  end

  def survive_attack?
  end

  def self.all
    return @@horde
  end

  def self.new_day
  end

  def self.some_die_off
  end

  def self.spawn
    num = rand(1..@@plague_level)
    num.times do
      @@horde << Zombie.new(rand(1..@@max_speed),rand(1..@@max_strength))
    end
  end

  def self.increase_plague_level
  end

end


# x = []
# x.each do |d,h|
#   if d.to_i > @@max_speed
#     d.to_i = @@default_speed
#       if h.to_i> @@max_strength
#         h.to_i = @@default_strength
#       return x
#   elsif h.to_i > @@max_strength
#     y-to_i = @@default_strength
