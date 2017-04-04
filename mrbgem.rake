require_relative 'mrblib/simulacre/version'

spec = MRuby::Gem::Specification.new('simulacre') do |spec|
  spec.bins    = ['simulacre']
  spec.add_dependency 'mruby-print', :core => 'mruby-print'
  spec.add_dependency 'mruby-mtest', :mgem => 'mruby-mtest'
end

spec.license = 'MIT'
spec.author  = 'MRuby Developer'
spec.summary = 'simulacre'
spec.version = Simulacre::VERSION
