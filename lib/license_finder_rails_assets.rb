require 'license_finder_rails_assets/package_manager'
require 'license_finder/scanner'

module LicenseFinder
  class Scanner
    PACKAGE_MANAGERS = [LicenseFinderRailsAssets::PackageManager] +
                       LicenseFinder::Scanner::PACKAGE_MANAGERS
  end
end

module LicenseFinderRailsAssets
end
