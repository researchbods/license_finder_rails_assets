require 'license_finder'
require 'digest'

module LicenseFinderRailsAssets
  class RailsAsset < LicenseFinder::Package
    def package_manager
      'Rails asset'
    end

    class << self
      def from_file(path)
        version = Digest::SHA1.hexdigest(IO.read(path))
        RailsAsset.new(remove_prefix(path), version, install_path: path, package_manager: 'Rails asset')
      end

      def from_dir(path)
        digest = Digest::SHA1.new
        Dir["#{path}/**/*"].sort.each do |filename|
          digest << IO.read(filename) if File.file? filename
        end
        version = digest.hexdigest

        RailsAsset.new(remove_prefix(path), version, install_path: path, package_manager: 'Rails asset')
      end

      private

      def remove_prefix(path)
        path.sub(%r{^.*/app/assets/[^/]+/}, '')
      end
    end
  end
end
