module ZQuickblox
  module Dialog
    class GetDialogsRequest < Request
      def initialize(params)
        super()
        params = params.map { |key, value| "#{key}=#{value}" }.join("&")
        @uri    = "/chat/Dialog.json?#{params}"
        @method = :get
      end
    end
  end
end
