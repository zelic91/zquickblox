module ZQuickblox
  module Dialog
    class GetDialogsRequest < Request
      def initialize(params = nil)
        super()
        params = params.map { |key, value| "#{key}=#{value}" }.join("&") if params
        params = "" if params.nil?
        @uri    = "/chat/Dialog.json?#{params}"
        @method = :get
      end
    end
  end
end
