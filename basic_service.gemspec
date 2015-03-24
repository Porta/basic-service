Gem::Specification.new do |s|
  s.name = 'basic_service'
  s.version = '0.0.1'
  s.summary = 'Simple class for a simple service object implementation.'
  s.authors = ['Julián Porta']
  s.email = ['julian@porta.sh']
  s.homepage = "http://github.com/Porta/basic_service/"
  s.license = "MIT"
  s.files = `git ls-files`.split("\n")
  s.add_development_dependency "minitest", '~>5.5'
end