module ZQuickblox
  module Dialog
    class CreateDialogRequest < Request
      def initialize(params)
        super()
        @uri    = "/chat/Dialog.json"
        @method = :post
        @params = params
      end
    end
  end
end
