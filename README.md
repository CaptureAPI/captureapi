# CaptureAPI

## Installation

- Add the `captureapi` gem to your Gemfile.
- Configure the gem manually or with an initializer.

## Initializer for Rails 3.1

You will need to create an initializer before using the library.

Example:

```ruby
# config/initializers/captureapi.rb
CaptureAPI.configure do |config|
  config.api_key    = '1a243b45c'
  config.api_key_id = '3'
end
```

## View helpers

### thumbnail_tag(url, options = {})

Valid options are:

`width`: The width of the final thumbnail (default: `200`).
`height`: The height of the final thumbnail (default: `200`).
`alt`: The value of the `alt` attribute for the `<img>` tag (default: `"Thumbnail of #{url}"`).
