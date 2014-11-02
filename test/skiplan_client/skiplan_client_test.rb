# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client'
require 'skiplan_client/weather_object'

class SkiplanClientTest < Test::Unit::TestCase

  should 'retrieve weather data' do

    SkiplanClient.configure('../../data/lumi_response.xml')
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
    SkiplanClient.configure('../../data/lumi_response.xml')
    metrics = SkiplanClient.get_weather('CHINAILLON').metrics

    assert_equal '0/44', metrics.alpine[:total]
    assert_equal '0/17', metrics.nordic[:total]
    assert_equal '9/12', metrics.pedestrian[:total]
    assert_equal '0/14', metrics.snowshoes[:total]
    assert_equal '0/4', metrics.sledge[:total]
    assert_equal '0/8', metrics.snowpark[:total]
  end

  should 'change config url' do
    config = SkiplanClient.configure('my_new_url')
    assert_equal 'my_new_url', config
  end

end