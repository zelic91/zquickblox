require_relative '../../test_helper'

describe ZQuickblox::Session do

  subject { ZQuickblox::Session.new }

  it "should have uri when create" do
    subject.uri.wont_be_nil
  end

  it "should have response when execute" do
    subject.execute
    subject.response.wont_be_nil
    subject.token.wont_be_nil
  end
end
