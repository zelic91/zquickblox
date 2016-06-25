require_relative '../../test_helper'

describe ZQuickblox::Request do
  subject { ZQuickblox::Request.new }

  it "should initialize variable" do
    subject.connection.wont_be_nil
    subject.headers.wont_be_nil
    subject.uri.must_be_nil
  end
end
