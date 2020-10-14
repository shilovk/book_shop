class Shop < ApplicationRecord
  has_many :book_shops
  has_many :books, through: :book_shops

  validates :name, presence: true

  def add_book(book)
    return unless book

    books.push book
  end

  def books_in_stock(book)
    return unless book

    book_shops.where(book_id: book.id, type_of_position: 'stock')
  end

  def sell_book(book)
    return unless book

    resource = book_shops.where(book_id: book.id, type_of_position: 'stock')&.first
    return unless resource

    resource.update_attribute(:type_of_position, 'sold')
  end

  def sold_books(book)
    return unless book

    book_shops.where(book_id: book.id, type_of_position: 'sold')
  end
end
