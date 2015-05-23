require 'spec_helper'

describe User do
  it "can run tests" do
    expect(true).to eq(true)
  end

  it "can see the database" do
    expect(User.all.length).to be >= (0)
  end

  it {should validate_presence_of(:name)}
  it {should validate_presence_of(:password_hash)}
  it {should validate_presence_of(:email)}

  it {should validate_uniqueness_of(:email)}
end
