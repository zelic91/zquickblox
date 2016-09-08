require_relative '../../test_helper'

describe ZQuickblox::User do

  it "should create new user" do
    user = ZQuickblox::User.create({email: "#{Time.now.to_i}@email.com", password: "#{Time.now.to_i}"})
    user.id.wont_be_nil
  end

  it "should find user" do
    user = ZQuickblox::User.find("#{Time.now.to_i}@email.com")
    assert user.nil?
  end
end
