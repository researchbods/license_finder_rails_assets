license_finder_rails_assets
===========================

[![Build Status](https://travis-ci.org/researchbods/license_finder_rails_assets.svg?branch=master)](https://travis-ci.org/researchbods/license_finder_rails_assets)

This gem extends [license_finder][license_finder], making it treat local asset files as packages.

It's a bit experimental, which is why it's a gem and not a PR against
license_finder. Once it's gained some stability and 'niceness' we intended to
try to get it added to license_finder :-)

[license_finder]: https://github.com/pivotal/LicenseFinder

Installation and Usage
======================

```console
$ cd mycoolrailsapp
$ gem install license_finder_rails_assets
$ license_finder_rails_app
```

If you're using bundler to manage your dependencies:

```console
$ cd mycoolrailsapp
$ bundle add --group=development,test license_finder_rails_assets
$ bundle exec license_finder_rails_app
```

You only need to use license_finder_rails_assets to run license validation steps,
for dependency license tweaks (i.e. any of the `license`,
`ignored_dependencies`, `whitelist`, or `blacklist` commands) you can use
license_finder as normal (although license_finder_rails_assets will still work)

How it works
============

Under the hood the license_finder_rails_assets executable requires
license_finder, then appends a new package manager to the
`LicenseFinder::Scanner::PACKAGE_MANAGERS` constant (this is what causes a
warning about redefining a constant). Other than that, it just contains a normal
`LicenseFinder::PackageManager` and `LicenseFinder::Package` implementation for
rails assets.

Future work
===========

* Rather than having each file as its own dependency, try to figure out where
  package boundaries lie.
  * Detect license files (e.g. LICENSE, license.txt)
* Attempt to detect license declarations within comments.
