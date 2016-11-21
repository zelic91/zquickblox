require_relative '../../test_helper'

describe ZQuickblox::Dialog do

  it "should create new dialog" do
    login = "#{Time.now.to_i+1}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog.id.wont_be_nil
  end

  it "should update dialog info" do
    params={name: "My Dialog", occupants_ids: "1,2,3,4"}
    login = "#{Time.now.to_i+2}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog = ZQuickblox::Dialog.update(login, password, dialog.id, params)
    dialog.id.wont_be_nil
    assert_equal(dialog.name, params[:name], "should update name")
  end

  it "should get dialogs" do
    login = "#{Time.now.to_i+3}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog.id.wont_be_nil
    dialogs = ZQuickblox::Dialog.get(login, password, {id: dialog.id})
    assert_equal(dialogs.count, 1, "should return one item")
    assert_equal(dialogs.first.occupants_ids.count, 1, "should have one occupant")
  end

  it "should get dialogs" do
    login = "#{Time.now.to_i+4}"
    password = "#{Time.now.to_i}"
    user = ZQuickblox::User.create({login: login, password: password})
    dialog = ZQuickblox::Dialog.create(login, password, {type: 2, occupants_ids: "", name: "Dialog name"})
    dialog.id.wont_be_nil
    dialogs = ZQuickblox::Dialog.get(login, password)
    assert_equal(dialogs.count, 1, "should return one item")
    assert_equal(dialogs.first.occupants_ids.count, 1, "should have one occupant")
  end
end
