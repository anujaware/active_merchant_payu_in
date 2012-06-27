# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "active_merchant/payu_in/version"

Gem::Specification.new do |s|
  s.name        = "active_merchant_payu_in"
  s.version     = ActiveMerchant::Billing::Integrations::PayuIn::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Ram Singla"]
  s.email       = ["ram.singla@gmail.com"]
  s.homepage    = "http://www.payu.in"
  s.summary     = %q{PayU.in Payment Gateweay Integration Kit}
  s.description = %q{PayU.in Payment Gateway integration for ActiveMerchant}

  s.rubyforge_project = "active_merchant_payu_in"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3
    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_runtime_dependency(%q<activemerchant>, ["~> 1.8"])
    else
      s.add_dependency(%q<rspec>, ["~> 2.7.0"])
      s.add_dependency(%q<activemerchant>, ["~> 1.8"])
    end
  else
    s.add_dependency(%q<rspec>, ["~> 2.7.0"])
    s.add_dependency(%q<activemerchant>, ["~> 1.8"])
  end
end
