module ZQuickblox
  module User
    class LoginUserRequest < Request
      def initialize(login, password)
        super()
        @uri    = "/users/by_login.json?login=#{login}"
        @method = :get
        @params = params
      end
    end
  end
end
