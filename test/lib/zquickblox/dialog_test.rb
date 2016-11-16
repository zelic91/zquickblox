require_relative '../../test_helper'

describe ZQuickblox::Dialog do

  it "should create new dialog" do
    login = "#{Time.now.to_i}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog.id.wont_be_nil
  end

  it "should update dialog info" do
    params={name: "My Dialog", occupants_ids: "1,2,3,4"}
    login = "#{Time.now.to_i}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog = ZQuickblox::Dialog.update(login, password, dialog.id, params)
    dialog.id.wont_be_nil
    assert_equal(dialog.name, params[:name], "should update name")
  end
end
