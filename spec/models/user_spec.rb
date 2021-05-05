require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is not valid without a name' do
    expect(User.new).to_not be_valid
  end

  it 'is valid with a name' do
    expect(User.new(name: Faker::Name.name)).to be_valid
  end
end
