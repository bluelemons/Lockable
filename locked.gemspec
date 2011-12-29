$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "locked/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "locked"
  s.version     = Locked::VERSION
  s.authors     = ["Oldani Pablo"]
  s.email       = ["oldani.pablo@gmaill.com"]
  s.homepage    = "https://github.com/BlueLemon/Lockable"
  s.summary     = "Locked is a plugin to freeze and lock some fields in a model"
  s.description = "Locked is a plugin to freeze and lock some fields in a model. This means you can edit some data if you already lock it, but you could edit other fields in the same register if you dont set it like lockable"

  s.files = Dir["{app,config,db,lib}/**/*"] + ["MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", "~> 3.1.1"

  s.add_development_dependency "sqlite3"
end
