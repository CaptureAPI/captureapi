require 'uri'
require 'digest/sha2'
require 'time'

module CaptureAPI
  module API
    class << self
      def thumbnail_uri(url, options = {})
        configuration = CaptureAPI::configuration

        options[:width]         ||= 200
        options[:height]        ||= 200
        options[:cache]         ||= '1h'
        options[:manipulations] ||= "thumbnail #{options[:width]} #{options[:height]}"

        query = {
          :url           => url,
          :key_id        => configuration.api_key_id,
          :cache         => options[:cache],
          :hash          => request_hash(url),
          :manipulations => options[:manipulations]
        }

        uri = URI::HTTP.build({
          :host  => configuration.host,
          :path  => '/inline_capture',
          :query => query.to_query
        })

        uri.scheme = 'https'
        uri
      end

      def request_hash(url)
        configuration = CaptureAPI::configuration
        api_key = configuration.api_key
        date = Time.now.utc.strftime('%Y-%m-%d')
        hash_data = "#{url}#{api_key}#{date}"
        digest = Digest::SHA2.new(256)
        digest.hexdigest(hash_data)
      end
    end
  end
end
