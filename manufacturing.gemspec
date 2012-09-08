# -*- encoding: utf-8 -*-

Gem::Specification.new do |gem|
  gem.authors       = ["Brandon Fosdick"]
  gem.email         = ["bfoz@bfoz.net"]
  gem.description   = %q{Tools for generating manufacturing drawings and related files}
  gem.summary       = %q{All your manufacturing are belong to us}
  gem.homepage      = "http://github.com/bfoz/manufacturing"

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "manufacturing"
  gem.require_paths = ["lib"]
  gem.version       = 0
end
