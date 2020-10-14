require 'rails_helper'

describe 'Shops API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end
  let!(:current_user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: current_user.id) }

  describe 'PATCH /api/v1/shops/:id/sell' do
    let(:method) { :patch }
    let!(:shop) { create(:shop) }
    let!(:book) { create(:book) }
    let(:books_count) { 15 }
    let(:books_sold_count) { books_count - 2 }
    let(:api_path) { sell_api_v1_shop_path(shop) }

    before do
      books_count.times { shop.add_book(book) }
    end

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      let(:request_params) do
        { book_id: book.id,
          count: books_sold_count,
          access_token: access_token.token }
      end

      before do
        do_request method, api_path, params: request_params, headers: headers
      end

      it 'returns success status' do
        expect(response).to be_successful
      end

      it 'books sold count is correct' do
        expect(shop.sold_books(book).count).to eq(books_sold_count)
      end
    end
  end
end
