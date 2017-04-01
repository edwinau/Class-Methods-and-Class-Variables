class Book
  # attr_reader :on_shelf, :on_loan
  # attr_accessor :due_date, :title, :author, :isbn

  @@on_shelf = [] #contains collection for lent.
  @@on_loan = [] #contains collection borrowed.

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
    # @@on_shelf >> self
    due_date = "nil"
    return true
  end

  def self.borrowed_array
    @@on_loan
    # @@on_shelf
  end

  def self.borrowed(book)
    if book.lent_out?
      return true
    else
      return false
    end
  end
  #
  # def return_to_library
  #   @@_shelf < self
  #   @@_loan >> self
  # end

  # def self.current_due_date
  #
  # end
  #
  # def self.overdue_books
  # end
  #
  # def self.browse
  #   @@on_shelf[rand]
  # end
  #
  # def self.available
  #   @@on_shelf
  # end
  #

end
