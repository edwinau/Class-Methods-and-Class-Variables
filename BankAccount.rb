class BankAccount



  attr_accessor :balance



  def initialize
    @balance = 0
    @@interest_rate = 1.4
    @@accounts = [] #eventually store all accounts
  end



  def deposit(num)
    num + @balance
  end

  def withdraw(num)
    @balance - num
  end

  def self.create(x)
    BankAccount.new = x + @@accounts
    x

  def self.total_funds
    @@acounts [[x]]
      account += @@accounts
  end

  def self.interest_time(x)
    @@accounts.each do |x|
      x
    @@interest_rate
    end
  end
end
end
