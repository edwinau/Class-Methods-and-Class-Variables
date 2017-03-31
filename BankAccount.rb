class BankAccount

  attr_accessor :balance, :deposit, :withdraw
  @@accounts = []
  @@interest_rate = 1.4

  def self.abc(account)
    @@accounts << account
  end

  def initialize
    @balance = 0
  end

  def deposit(num)
    num + @balance
  end

  def withdraw(num)
    @balance - num
  end

  def self.create
     @@accounts << BankAccount.new
  end

  def self.total_funds
   @@accounts.each do |x|
     x = 0
     x += x.balance.to_i
     return x
   end
  end

  def self.interest_time
    @@accounts.each do |x|
      x.balance.to_i * @@interest_rate
    end
  end
end
