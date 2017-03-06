module ZQuickblox
  class Request
    API_ENDPOINT = "https://api.quickblox.com"

    attr_accessor :params, :headers, :method, :response, :response_body, :errors
    attr_reader :connection
    attr_reader :uri

    def initialize
      @connection = Faraday.new(url: Request::API_ENDPOINT) do |faraday|
        faraday.request  :url_encoded
        faraday.response :logger
        faraday.adapter  Faraday.default_adapter
      end

      @headers = {}
    end

    def header(key, value)
      headers[key] = value
    end

    def before_request
    end

    def after_request
    end

    def execute
      before_request

      get    if @method == :get
      post   if @method == :post
      put    if @method == :put
      delete if @method == :delete

      if @response.status != 404 && @response.body.length > 1
        @response_body = JSON.parse(@response.body)
      else
        @response_body = {}
      end

      @errors = @response_body["errors"] if @response.status != 404
      if @errors
        if @errors.kind_of?(Hash)
          raise ZQuickblox::Error.new(messages: @errors["base"]) if !@errors["base"].nil?
          message = ""
          @errors.each do |key, value|
            message += "; " + key
            message += " " + value.join(", ")
          end
          raise ZQuickblox::Error.new(messages: message)
        end
      end

      after_request
    end

    private

    def handle_request(request)
      request.url        @uri
      request.headers =  @headers
      request.body    =  @params
    end

    def get
      @response = @connection.get do |request|
        handle_request(request)
      end
    end

    def post
      @response = @connection.post do |request|
        handle_request(request)
      end
    end

    def put
      @response = @connection.put do |request|
        handle_request(request)
      end
    end

    def delete
      @response = @connection.delete do |request|
        handle_request(request)
      end
    end
  end
end
