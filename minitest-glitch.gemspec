# -*- encoding: utf-8 -*-
# stub: minitest-glitch 1.0.0.20151113174437 ruby lib

Gem::Specification.new do |s|
  s.name = "minitest-glitch"
  s.version = "1.0.0.20151113174437"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib"]
  s.authors = ["Mark Daggett"]
  s.date = "2015-11-13"
  s.description = "Print out glitch for your test passes, fails, and skips\n\nInspired by https://github.com/tenderlove/minitest-emoji"
  s.email = ["mark@humansized.com"]
  s.extra_rdoc_files = ["CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "CHANGELOG.rdoc", "README.rdoc"]
  s.files = [".autotest", "CHANGELOG.rdoc", "Manifest.txt", "README.rdoc", "Rakefile", "lib/minitest/glitch.rb", "lib/minitest/glitch_plugin.rb", "test/test_minitest_glitch.rb"]
  s.homepage = "http://github.com/heavysixer/minitest-glitch"
  s.licenses = ["MIT"]
  s.rdoc_options = ["--main", "README.rdoc"]
  s.rubygems_version = "2.2.2"
  s.summary = "Print out glitch for your test passes, fails, and skips  Inspired by https://github.com/tenderlove/minitest-emoji"

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<minitest>, ["~> 5.8"])
      s.add_development_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_development_dependency(%q<hoe>, ["~> 3.14"])
    else
      s.add_dependency(%q<minitest>, ["~> 5.8"])
      s.add_dependency(%q<rdoc>, ["~> 4.0"])
      s.add_dependency(%q<hoe>, ["~> 3.14"])
    end
  else
    s.add_dependency(%q<minitest>, ["~> 5.8"])
    s.add_dependency(%q<rdoc>, ["~> 4.0"])
    s.add_dependency(%q<hoe>, ["~> 3.14"])
  end
end
