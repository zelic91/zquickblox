module ZQuickblox
  module Dialog
    class UpdateDialogRequest < Request
      def initialize(id, params)
        super()
        @uri    = "/chat/Dialog/#{id}.json"
        @method = :put
        @params = params
      end
    end
  end
end
