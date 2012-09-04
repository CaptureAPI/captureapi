require 'captureapi/view_helpers'
module CaptureAPI
  class Railtie < Rails::Railtie
    initializer 'CaptureAPI.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
