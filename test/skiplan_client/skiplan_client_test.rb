# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client'

class SkiplanClientTest < Test::Unit::TestCase

  should 'test nokogiri open and xpath text function' do

    xml = Nokogiri::XML(open('http://api.openweathermap.org/data/2.5/forecast/daily?q=tokyo&mode=xml&units=metric&cnt=1'))
    city = xml.xpath('//name').text
    country = xml.xpath('//country').text

    assert_equal 'Tokyo', city
    assert_equal 'JP', country

  end
end