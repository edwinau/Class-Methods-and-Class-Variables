class Vampire

  attr_reader
  attr_accessor :name, :age, :in_coffin, :drank_blood_today

    @@coven = []

    def initialize(name,age)
      @name = name
      @age = age
      @in_coffin = true
      @drank_blood_today = true
    end

    def self.create(name,age)
      x = Vampire.new(name,age)
      @@coven << x
      return x
    end

    def drink_blood
      @drank_blood_today = true
    end

    def self.sunrise
      @@coven.delete_if {|x| x.in_coffin == false || x.drank_blood_today == false}
    end

    def self.sunset
      @@coven.each do |x|
        x.in_coffin = false
        x.drank_blood_today = false
      end
    end

    def go_home
     @in_coffin = true
    end
  end
  
=begin Debugger
    def self.coven
      @@coven.each do |x|
        puts x
      end
    return @@coven
    end
=end
