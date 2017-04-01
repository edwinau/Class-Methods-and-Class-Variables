class Book
  attr_reader :on_shelf, :on_loan
  attr_accessor :due_date

  @@on_shelf = [] #contains collection for lent.
  @@on_loan = [] #contains collection borrowed.
  @@due_date = {} #contains due dates

  def self.create(title, author, isbn)
    x = Book.new(title, author, isbn)
    @@on_shelf << x
    return x
  end

  def initialize (title, author, isbn)
    @title = title
    @author = author
    @isbn = isbn
  end

  def lent_out? #works
    return @@on_loan.include?(self)
  end

  def borrow
    if self.lent_out?
      return false
    end
    @@on_loan << self
    @@due_date[self] = Time.now + (3) #(60*60*24*5)
    return true
  end

  # Code for debugging
  # def self.borrowed_array
  #   @@on_loan
  #   # @@on_shelf
  # end
  #
  # def self.duedate_array
  #   @@due_date.each do |k,v|
  #       puts v.to_s
  #   end
  # end

  def self.renew(book)
    if book.lent_out?
      puts "renewing #{book}"
      @@due_date[book] = Time.now + (3) #(60*60*24*5)
    end
  end

  def self.borrowed(book)
    if book.lent_out?
      return true
    else
      return false
    end
  end
  #
  def return_to_library
    if self.lent_out?
      @@on_shelf << self
      @@due_date.delete self
      @@on_loan.delete self
      puts "abc"
      return true
    else
      return false
    end
  end

  def self.current_due_date(book)
    @@due_date.each do |k,v|
      if k == book
        puts "found book"
        return v
      end
    end
    return Time.now
  end

  def self.overdue_books
    x = []
    @@due_date.each do |k,v|
      if v <=> Time.now
        puts "#{k} + #{v}"
        x << k
      end
    end
    return x
  end
end

  # def self.browse
  #   @@on_shelf[rand]
  # end

  # def self.available
  #   @@on_shelf
  # end
  # #
