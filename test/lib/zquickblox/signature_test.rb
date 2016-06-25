require_relative '../../test_helper'

describe ZQuickblox::Signature do
  it "must generate signature" do
    params = { auth_key: ZQuickblox.config.auth_key }
    signature = ZQuickblox::Signature.generate_signature(params, ZQuickblox.config.auth_secret)
    signature.wont_be_nil
  end
end
