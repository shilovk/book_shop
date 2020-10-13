require 'rails_helper'

RSpec.describe Book, type: :model do
  it { should belong_to(:publisher) }
  it { should validate_presence_of :title }
  it { should have_many(:shops).through(:book_shops) }
end
