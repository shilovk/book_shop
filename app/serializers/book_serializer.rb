class BookSerializer < ActiveModel::Serializer
  attributes :id, :title, :created_at, :updated_at

  belongs_to :publisher
  has_many :book_shops
  has_many :shops, through: :book_shops
end
