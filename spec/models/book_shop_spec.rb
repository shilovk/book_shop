require 'rails_helper'

RSpec.describe BookShop, type: :model do
  it { should belong_to(:book) }
  it { should belong_to(:shop) }
  it { should validate_presence_of :type_of_position }
  it { should allow_values('stock', 'sold').for(:type_of_position) }

  describe 'default of type_of_position' do
    let(:shop) { create(:shop) }
    let(:book) { create(:book) }

    it "should default type_of_position to 'stock'" do
      shop.add_book(book)

      expect(BookShop.last.type_of_position).to eq('stock')
    end
  end
end
