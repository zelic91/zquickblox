module ZQuickblox
  module User
    class CreateUserRequest < Request
      def initialize(params)
        super()
        @uri    = "/users.json"
        @method = :post
        @params = params
      end
    end
  end
end
