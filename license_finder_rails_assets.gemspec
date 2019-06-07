Gem::Specification.new do |s|
  s.required_ruby_version = '>= 2.3.3'
  s.name = 'license_finder_rails_assets'
  s.version = '1.0.0'
  s.authors = [
    'Telyn Roat'
  ]

  s.email = ['troat@researchbods.com']
  s.homepage = ''
  s.summary = <<-SUMMARY
    Audit the OSS licenses of your applications's dependencies, even if they're
    stored as rails assets like it's 2005
  SUMMARY

  s.description = <<-DESCRIPTION
    LicenseFinderRailsAssets is a plugin for LicenseFinder
    that adds support for declaring licenses and decisions
    for rails assets.
  DESCRIPTION

  s.license = 'MIT'

  s.add_dependency 'license_finder', '~> 5.8'
  s.add_development_dependency 'fuubar', '~> 2.3'
  s.add_development_dependency 'guard', '~> 2.15'
  s.add_development_dependency 'guard-rspec', '~> 4.7'
  s.add_development_dependency 'rspec', '~> 3.8'

  s.files = Dir[
    'lib/**/*.rb',
    'bin/*',
    'README.md'
  ]
  s.executables = %w[license_finder_rails_assets]
end
