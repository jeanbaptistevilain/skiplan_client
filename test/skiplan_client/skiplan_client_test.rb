# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client'
require 'skiplan_client/skiplan'

class SkiplanClientTest < Test::Unit::TestCase

  setup do
    if Dir.pwd.include?('test')
      SkiplanClient.configure('../../data/lumi_response.xml')
    else
      SkiplanClient.configure('data/lumi_response.xml')
    end
  end

  should 'retrieve weather data' do
    weather = SkiplanClient.get_weather('CHINAILLON')

    today_forecast = weather.forecasts['j']
    assert_equal '101' , today_forecast.weather_am
    assert_equal '101' , today_forecast.weather_pm
    assert_equal '+12' , today_forecast.temp_am
    assert_equal '+20' , today_forecast.temp_pm
    assert_equal '+4'  , today_forecast.temp_felt
    assert_equal '4'   , today_forecast.wind_speed
    assert_equal 'SE'  , today_forecast.wind_dir

    tomorrow_forecast = weather.forecasts['j+1']
    assert_equal '104' , tomorrow_forecast.weather_am
    assert_equal '106' , tomorrow_forecast.weather_pm
    assert_equal '+17' , tomorrow_forecast.temp_am
    assert_equal '+21' , tomorrow_forecast.temp_pm
    assert_equal '7'   , tomorrow_forecast.wind_speed
    assert_equal 'SO'  , tomorrow_forecast.wind_dir

    j2_forecast = weather.forecasts['j+2']
    assert_equal '106' , j2_forecast.weather_am
    assert_equal '104' , j2_forecast.weather_pm
    assert_equal '+12' , j2_forecast.temp_am
    assert_equal '+18' , j2_forecast.temp_pm
    assert_equal '7'   , j2_forecast.wind_speed
    assert_equal 'O'  , j2_forecast.wind_dir

    j3_forecast = weather.forecasts['j+3']
    assert_equal '101' , j3_forecast.weather_am
    assert_equal '103' , j3_forecast.weather_pm
    assert_equal '+16' , j3_forecast.temp_am
    assert_equal '+20' , j3_forecast.temp_pm
    assert_equal '7'   , j3_forecast.wind_speed
    assert_equal 'O'  , j3_forecast.wind_dir
  end

  should 'retrieve metrics data' do
    metrics = SkiplanClient.get_weather('CHINAILLON').metrics

    assert_equal '0/44', metrics.alpine[:total]
    assert_equal '0/17', metrics.nordic[:total]
    assert_equal '35/47.5km', metrics.pedestrian[:total]
    assert_equal '0/61km', metrics.snowshoes[:total]
    assert_equal '0/4', metrics.sledge[:total]
    assert_equal '0/8', metrics.snowpark[:total]
  end

  should 'retrieve zones data' do
    zones = SkiplanClient.get_weather('CHINAILLON').zones

    assert_equal 10, zones.length
    assert_equal 'ALPIN CHINAILLON', zones.keys[0]

    ac_zone = zones['ALPIN CHINAILLON']
    assert_equal 10, ac_zone.skilifts.count
    assert_equal 16, ac_zone.slopes.count
  end

  should 'change config url' do
    config = SkiplanClient.configure('my_new_url')
    assert_equal 'my_new_url', config
  end

  should 'retrieve text messages' do
    text_forecasts = SkiplanClient.get_weather('CHINAILLON').text_messages

    assert_equal 'Pluie. Vent faible variable.', text_forecasts['today_forecast']
    assert_equal 'Col de la Colombière ouvert.', text_forecasts['forecasts_comment']
    assert_equal 'LE DOMAINE SKIABLE EST FERME POUR LA SAISON 2013/2014.', text_forecasts['slopes_comment']
  end
end