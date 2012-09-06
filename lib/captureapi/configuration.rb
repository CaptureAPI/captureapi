module CaptureAPI
  # Used to set up and modify settings for the requests.
  class Configuration
    OPTIONS = [:api_key, :api_key_id, :scheme, :host].freeze

    # The API key for your user.
    attr_accessor :api_key

    # The API key id for your user.
    attr_accessor :api_key_id

    # The scheme to use for requests (defaults to https).
    attr_accessor :scheme

    # The host to connect to (defaults to api.captureapi.com).
    attr_accessor :host

    def initialize
      @host = 'api.captureapi.com'
      @scheme = 'https'
    end
  end
end
