require 'rails_helper'

RSpec.describe BookShop, type: :model do
  it { should belong_to(:book) }
  it { should belong_to(:shop) }
  it { should validate_presence_of :type_of_position }
  it { should allow_values('stock', 'sold').for(:type_of_position) }
end
