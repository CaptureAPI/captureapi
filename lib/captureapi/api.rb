require 'uri'
require 'digest/sha2'
require 'time'

module CaptureAPI
  module API
    class << self
      def thumbnail_uri(url, options = {})
        options[:width]         ||= 200
        options[:height]        ||= 200
        options[:cache]         ||= '1h'
        options[:manipulations] ||= "thumbnail #{options[:width]} #{options[:height]}"

        query = {
          :url           => url,
          :key_id        => CaptureAPI.configuration.api_key_id,
          :cache         => options[:cache],
          :hash          => request_hash(url),
          :manipulations => options[:manipulations]
        }

        uri = URI::HTTP.build({
          :host  => CaptureAPI.configuration.host,
          :path  => '/inline_capture',
          :query => query.to_query
        })

        uri.scheme = CaptureAPI.configuration.scheme
        uri
      end

      # The request_hash is built by computing the SHA256 of the url, api_key and current date (Y-M-D).
      # This hash is used to authenticate the request.
      def request_hash(url)
        api_key = CaptureAPI.configuration.api_key
        date = Time.now.utc.strftime('%Y-%m-%d')
        hash_data = "#{url}#{api_key}#{date}"
        digest = Digest::SHA2.new(256)
        digest.hexdigest(hash_data)
      end
    end
  end
end
