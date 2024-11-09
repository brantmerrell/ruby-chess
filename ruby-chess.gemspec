lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ruby_chess/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-chess"
  spec.version       = RubyChess::VERSION
  spec.authors       = ["Your Name"]
  spec.email         = ["your.email@example.com"]
  spec.summary       = "A Ruby chess library"
  spec.description   = "A Ruby implementation of python-chess functionality"
  spec.homepage      = "https://github.com/yourusername/ruby-chess"
  spec.license       = "MIT"
  spec.files         = Dir.glob("{lib}/**/*") + %w(README.md LICENSE.txt)
  spec.require_paths = ["lib"]

  spec.required_ruby_version = ">= 2.7.0"

  spec.add_development_dependency "rspec", "~> 3.12"
  spec.add_development_dependency "rake", "~> 13.0"
end
