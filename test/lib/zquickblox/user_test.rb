require_relative '../../test_helper'

describe ZQuickblox::User do

  it "should create new user" do
    user = ZQuickblox::User.create({email: "#{Time.now.to_i}@email.com", password: "#{Time.now.to_i}"})
    user.id.wont_be_nil
  end

  it "should delete user" do
    user = ZQuickblox::User.create({email: "#{Time.now.to_i}@email.com", password: "#{Time.now.to_i}"})
    user.id.wont_be_nil
    assert ZQuickblox::User.delete(user.id)
  end
end
