require 'rails_helper'

RSpec.describe Company, :type => :model do
  it "has a valid factory" do
    expect(create(:company)).to be_valid
  end

  it "is invalid without a name" do
    expect(build(:company, name: nil)).to_not be_valid
  end
end
