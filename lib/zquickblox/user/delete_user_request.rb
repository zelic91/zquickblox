module ZQuickblox
  module User
    class DeleteUserRequest < Request
      def initialize(id)
        super()
        @uri = "/users/#{id}.json"
        @method = :delete
      end
    end
  end
end
