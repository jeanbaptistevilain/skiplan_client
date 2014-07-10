# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client'
require 'skiplan_client/weather_object'

class SkiplanClientTest < Test::Unit::TestCase

  should 'test nokogiri open and xpath text function' do

    xml = Nokogiri::XML(open('http://api.openweathermap.org/data/2.5/forecast/daily?q=tokyo&mode=xml&units=metric&cnt=1'))
    city = xml.xpath('//name').text
    country = xml.xpath('//country').text

    assert_equal 'Tokyo', city
    assert_equal 'JP', country

  end

  should 'test get_weather founction' do

    config = SkiplanClient.configure('C:\Users\Simon\Desktop\Stage\GitHub\skiplan_client\data\lumi_response.xml')
    weather = SkiplanClient.get_weather

    assert_equal '101' , weather.auj_ciel_id_matin
    assert_equal '101' , weather.auj_ciel_id_apm
    assert_equal '104' , weather.dem_ciel_id_matin
    assert_equal '106' , weather.dem_ciel_id_apm
    assert_equal '+12' , weather.auj_temp_matin
    assert_equal '+20' , weather.auj_temp_apm
    assert_equal '+17' , weather.dem_temp_matin
    assert_equal '+21' , weather.dem_temp_apm
    assert_equal '+4' , weather.auj_temp_rst
    assert_equal '4' , weather.auj_vent_kmh
    assert_equal 'SE' , weather.auj_vent_dir
    assert_equal '0' , weather.auj_vit_rafales
    assert_equal '100' , weather.visibilite

  end

  should 'change config url' do

    config = SkiplanClient.configure('http://api.openweathermap.org/data/2.5/forecast/daily?q=tokyo&mode=xml&units=metric&cnt=1')

    assert_equal 'http://api.openweathermap.org/data/2.5/forecast/daily?q=tokyo&mode=xml&units=metric&cnt=1', config
  end

end