module ZQuickblox
  module Util
    class << self
      def symbolize_keys(hash)
        new_hash = Hash.new
        hash.each { |key, value| new_hash[key.to_sym] = value }
        return new_hash
      end
    end
  end
end
