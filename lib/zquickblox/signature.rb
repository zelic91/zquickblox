module ZQuickblox
  module Signature
    class << self
      def generate_signature(params, secret)
        pairs = params.map { |key, value| "#{key}=#{value}" }
        pairs.sort!
        body  = pairs.join("&")
        return hmac_sha(body, secret)
      end

      private

      def hmac_sha(data, secret)
        require "base64"
        require "cgi"
        require "openssl"
        hmac = OpenSSL::HMAC.hexdigest(OpenSSL::Digest.new("sha1"), secret.encode("ASCII"), data.encode("ASCII"))
        return hmac
      end
    end
  end
end
