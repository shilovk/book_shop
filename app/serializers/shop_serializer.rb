class ShopSerializer < ActiveModel::Serializer
  attributes :id, :name, :created_at, :updated_at

  has_many :book_shops
  has_many :books, through: :book_shops
end
