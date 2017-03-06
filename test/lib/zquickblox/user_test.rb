require_relative '../../test_helper'

describe ZQuickblox::User do

  it "should create new user" do
    user = ZQuickblox::User.create({email: "#{rand(99..Time.now.to_i)}@email.com", password: "#{Time.now.to_i}"})
    user.id.wont_be_nil
  end

  it "should find user" do
    user = ZQuickblox::User.find("#{rand(99..Time.now.to_i)}@email.com")
    assert user.nil?
  end

  it "should delete user" do
    login = "#{Time.now.to_i}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    user.id.wont_be_nil
    response = ZQuickblox::User.delete(login, password, user.id)
    response.wont_be_nil
  end
end
