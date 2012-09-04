require 'rubygems'
require 'captureapi/version'
require 'captureapi/configuration'

module CaptureAPI
  class << self
    # A CaptureAPI configuration object. Must act like a hash and return sensible
    # values for all CaptureAPI configuration options. See CaptureAPI::Configuration
    attr_writer :configuration

    # Call this method to modify defaults in your initializers.
    #
    # @example
    #   CaptureAPI.configure do |config|
    #     config.api_key    = '1a243b45c'
    #     config.api_key_id = '3'
    #   end
    def configure
      yield(configuration)
    end

    # The Configuration object.
    # @see CaptureAPI.configure
    def configuration
      @configuration ||= Configuration.new
    end
  end
end
