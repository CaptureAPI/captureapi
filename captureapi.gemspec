# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require 'captureapi/version'

Gem::Specification.new do |s|
  s.name        = %q{captureapi}
  s.version     = CaptureAPI::VERSION.dup
  s.platform    = Gem::Platform::RUBY
  s.summary     = %q{Easily integrate website thumbnails into your web app.}
  s.description = %q{CaptureAPI provides view helpers for Rails 3.1 to easily integrate website thumbnails into your web app.}

  s.authors = ['CaptureAPI']
  s.email   = %q{webmaster@captureapi.com}
  s.homepage = 'http://captureapi.com'

  s.require_paths = ['lib']
  s.files = Dir['{generators/**/*,lib/**/*,rails/**/*,resources/*,script/*,app/**/*}'] + %w{Rakefile README.md}
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ['lib']
end
