require 'rails_helper'

RSpec.describe Publisher, type: :model do
  it { should validate_presence_of :name }
  # it { should have_many(:books) }
end
