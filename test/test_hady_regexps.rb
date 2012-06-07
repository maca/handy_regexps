require 'minitest/spec'
require 'minitest/autorun'
require 'ffaker'

$LOAD_PATH.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

require 'handy_regexps'

describe HandyRegexps do
  100.times do
    email = Faker::Internet.email
    it "should match email '#{email}'" do
      email.must_match HandyRegexps::Email
    end

    domain = Faker::Internet.domain_name
    it "should match domain '#{domain}'" do
      domain.must_match HandyRegexps::Url
    end

    uri = Faker::Internet.uri('http')
    it "should match url '#{uri}'" do
      uri.must_match HandyRegexps::Url
    end
  end
end
