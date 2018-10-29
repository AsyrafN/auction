require 'rails_helper'

RSpec.describe Product, type: :model do

  it "if search with valid keyword" do
    # FakeStubRequests.load
    @user = User.create(first_name: "bob", last_name: "smitch", email: "bob@gmail.com", password: "testing12")
    @roduct = Product.create(name: "mobile phone", user_id: @user.id)
    @product = Product.search_by_name("mobile")
    expect(@product.first.name).to eq("mobile phone")
  end
  it "if search with invalid keyword" do
    # FakeStubRequests.load
    @user = User.create(first_name: "bob", last_name: "smitch", email: "bob@gmail.com", password: "testing12")
    @roduct = Product.create(name: "mobile phone", user_id: @user.id)
    @product = Product.search_by_name("wakakaka")
    expect(@product.any?).to eq(false)
  end
end