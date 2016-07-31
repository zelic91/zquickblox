module ZQuickblox
  module User
    class DeleteUserRequest < Request
      def initialize(id)
        super()
        @uri    = "/users/#{id}.json"
        @method = :delete
        @params = params
      end
    end
  end
end
