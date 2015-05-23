require 'spec_helper'

describe User do
  it "can run tests" do
    expect(true).to eq(true)
  end

  it "can see the database" do
    expect(User.all.length).to be >= (0)
  end

  it {should validate_presence_of(:text)}
  it {should validate_presence_of(:due)}
end