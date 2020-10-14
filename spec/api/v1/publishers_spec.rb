require 'rails_helper'

describe 'Publishers API', type: :request do
  let(:headers) do
    { 'CONTENT_TYPE' => 'application/json',
      'ACCEPT' => 'application/json' }
  end
  let!(:current_user) { create(:user) }
  let(:access_token) { create(:access_token, resource_owner_id: current_user.id) }

  describe 'GET /api/v1/publisher/:id/shops' do
    let(:method) { :get }
    let!(:resource) { create(:publisher) }
    let(:api_path) { shops_api_v1_publisher_path(resource) }

    it_behaves_like 'API Authorizable'

    context 'authorized' do
      let(:resource_response) { json['shops'].first }
      let(:books_count) { 15 }
      let(:books_sold_count) { books_count - 2 }
      let(:copies_in_stock) { books_count - books_sold_count }
      let!(:book) { create(:book, publisher_id: resource.id) }
      let!(:shop) { create(:shop) }

      before do
        books_count.times { shop.add_book(book) }
        books_sold_count.times { shop.sell_book(book) }

        do_request method, api_path, params: { access_token: access_token.token }, headers: headers
      end

      it 'returns 200 status' do
        expect(response).to be_successful
      end

      it 'returns correct data' do
        expect(resource_response['id']).to eq shop.send('id').as_json
        expect(resource_response['name']).to eq shop.send('name').as_json
        expect(resource_response['books_sold_count']).to eq books_sold_count
        expect(resource_response['books_in_stock'].first['id']).to eq book.send('id').as_json
        expect(resource_response['books_in_stock'].first['title']).to eq book.send('title').as_json
        expect(resource_response['books_in_stock'].first['copies_in_stock']).to eq copies_in_stock
      end
    end
  end
end
