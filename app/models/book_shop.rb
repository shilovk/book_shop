class BookShop < ApplicationRecord
  TYPES = %w[stock sold].freeze

  belongs_to :book
  belongs_to :shop

  validates :type_of_position, presence: true, inclusion: { in: TYPES }
end
