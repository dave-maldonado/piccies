require 'rails_helper'

RSpec.describe Album, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:album)).to be_valid
  end

  it 'is invalid without a name' do
    expect(FactoryGirl.build(:album, name: nil)).to_not be_valid
  end
end
