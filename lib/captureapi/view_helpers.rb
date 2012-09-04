module CaptureAPI
  module ViewHelpers
    def thumbnail_tag(url, options = {})
      options.symbolize_keys!

      options[:width] ||= 200
      options[:height] ||= 200
      options[:alt] ||= "Thumbnail of #{url}"

      thumbnail_options = {
        :width  => options[:width],
        :height => options[:height]
      }

      image_tag(CaptureAPI::API::thumbnail_uri(url, thumbnail_options), options)
    end
  end
end
