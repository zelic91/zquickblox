require_relative '../../test_helper'

describe ZQuickblox::Dialog do

  it "should create new dialog" do
    login = "#{Time.now.to_i}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog.id.wont_be_nil
  end
end
