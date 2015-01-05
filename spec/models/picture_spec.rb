require 'rails_helper'

RSpec.describe Picture, type: :model do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:picture)).to be_valid
  end
end
