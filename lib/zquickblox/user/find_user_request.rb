module ZQuickblox
  module User
    class FindUserRequest < Request
      def initialize(login)
        super()
        @uri    = "/users/by_login.json?login=#{login}"
        @method = :get
        @params = params
      end
    end
  end
end
