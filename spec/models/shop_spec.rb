require 'rails_helper'

RSpec.describe Shop, type: :model do
  it { should validate_presence_of :name }
  it { should have_many(:books).through(:book_shops) }

  describe 'Operations with books' do
    let(:shop) { create(:shop) }
    let(:book) { create(:book) }

    describe '#add_book' do
      it 'Adds book to shop' do
        expect { shop.add_book(book) }.to change(shop.books, :count).by(1)
      end
    end

    describe '#books_in_stock' do
      it 'Checks book in stock' do
        shop.add_book(book)

        expect(shop.books_in_stock(book).count).to eq(1)
      end
    end

    describe '#sell_book' do
      it 'Sells book' do
        shop.add_book(book)

        expect { shop.sell_book(book) }.to change(shop.books_in_stock(book), :count).by(-1)
      end
    end

    describe '#sold_books' do
      it 'Checks sold book' do
        shop.add_book(book)
        shop.sell_book(book)

        expect(shop.sold_books(book).count).to eq(1)
      end
    end
  end
end
