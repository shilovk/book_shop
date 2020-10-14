class Api::V1::PublishersController < Api::V1::BaseController
  before_action :find_publisher, only: %i[show shops]

  authorize_resource

  def show
    render json: @publisher
  end

  def shops
    render json: { 'shops' => shops_data }
  end

  private

  def find_publisher
    @publisher = Publisher.find(params['id'])
  end

  def shops_data
    records = BookShop.joins(:shop)
                      .joins(:book)
                      .where(book: Publisher.first.books)
                      .select('shop_id as id, shops.name as shop_name, type_of_position as type_of_position, book_id, books.title as book_title')

    hash = records.each_with_object({}) do |e, m|
      m[e["id"]] = {} unless m[e["id"]]
      m[e["id"]]["id"] = e["id"]
      m[e["id"]]["name"] = e["shop_name"]
      m[e["id"]]["books_sold_count"] = 0 unless m[e["id"]]["books_sold_count"]

      if e["type_of_position"] == 'sold'
        m[e["id"]]["books_sold_count"] += 1

        next
      end

      m[e["id"]]["books_in_stock"] = {} unless m[e["id"]]["books_in_stock"]
      m[e["id"]]["books_in_stock"][e["book_id"]] = {} unless m[e["id"]]["books_in_stock"][e["book_id"]]
      m[e["id"]]["books_in_stock"][e["book_id"]]["id"] = e["book_id"]
      m[e["id"]]["books_in_stock"][e["book_id"]]["title"] = e["book_title"]
      m[e["id"]]["books_in_stock"][e["book_id"]]["copies_in_stock"] = 0 unless m[e["id"]]["books_in_stock"][e["book_id"]]["copies_in_stock"]
      m[e["id"]]["books_in_stock"][e["book_id"]]["copies_in_stock"] += 1
    end

    hash.values.map do |el|
      el.transform_values { |v| v.is_a?(Hash) ? v.values : v }
    end
  end
end
