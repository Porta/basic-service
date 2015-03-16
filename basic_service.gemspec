Gem::Specification.new do |s|
  s.name = 'basic_servce'
  s.version = '0.0.1'
  s.summary = 'Base class for simple service object'
  s.description = ''
  s.authors = ['Julián Porta']
  s.email = ['julian@porta.sh']
  s.homepage = "http://github.com/Porta/basic_service/"
  s.license = "MIT"
  s.files = `git ls-files`.split("\n")
  s.add_development_dependency "minitest"
end