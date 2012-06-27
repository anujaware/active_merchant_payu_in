# Active Merchant Billing Integration for PayU.in

Active Merchant is used in most modern Ruby applications which deal with financial transactions. It was developed for usage in Ruby on Rails web applications and integrates seamlessly as a plugin but it also works excellently as a stand alone library. (See [ActiveMerchant](http://activemerchant.org/))

This library provides support for payment gateway PayU by iBiBo Group. (See [PayU.in](http://payu.in/))

# Installation

* using with Rails 2.x

  write the following line in config/environment.rb

      config.gem 'active_merchant_payu_india'

  and run

      rake gems:install

* using with Bundler or Rails 3.x

  write the following line in Gemfile

      gem 'active_merchant_payu_india'

  and run

      bundle install

* using traditionally

  run

      sudo gem install active_merchant_payu_india

  and add the following line to the file where your ruby file

      require 'active_merchant_payu_india'

# Configuration

Configuration goes here

# Example Usage

    require 'active_merchant_payu_in'

# TODO

* Write code and documentation
* Fix project description in gemspec
* Change testing framework if necessary (see Rakefile, currently RSpec)
* Adjust active_merchant_payu_in.gemspec if your github name is not ramsingla
* Adjust License if your real name is not Ram Singla

# Author(s)
Ram Singla ( ram dot singla at gmail dot com )

# Copyright
Copyright (c) 2011 Ram Singla

# MIT License
Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
