class Api::V1::ShopsController < Api::V1::BaseController
  before_action :find_shop, only: :sell
  before_action :find_book, only: :sell

  authorize_resource

  def sell
    if selling
      render json: @shop, status: :ok
    else
      render json: { errors: @shop }, status: :unprocessable_entity
    end
  end

  private

  def sell_shop_params
    params.permit(:id, :book_id, :count)
  end

  def find_shop
    @shop = Shop.find(sell_shop_params['id'])
  end

  def find_book
    @book = Book.find(sell_shop_params['book_id'])
  end

  def selling
    sell_shop_params[:count].times do
      return false unless @shop.sell_book(@book)
    end
  end
end
