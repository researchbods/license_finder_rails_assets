require 'license_finder'
require 'license_finder_rails_assets/rails_asset'

module LicenseFinderRailsAssets
  class PackageManager < LicenseFinder::PackageManager
    def possible_package_paths
      [project_path.join('app/assets/javascripts'),
       project_path.join('app/assets/stylesheets')]
    end

    def current_packages
      possible_package_paths.map do |path|
        find_packages_in(path)
      end.flatten.compact
    end

    private

    def find_packages_in(path)
      Dir.entries(path).map do |filename|
        next nil if filename == '..' || filename == '.'

        fullpath = File.join(path, filename)
        next RailsAsset.from_file(fullpath) if File.file?(fullpath)

        if File.directory?(fullpath)
          if File.exist?(File.join(fullpath, '.treat_as_package'))
            RailsAsset.from_dir(fullpath)
          else
            find_packages_in(fullpath).flatten.compact
          end
        end
      end
    end
  end
end
