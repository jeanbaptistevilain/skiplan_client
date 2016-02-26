# encoding : UTF-8
require 'test/unit'
require 'shoulda-context'
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
    weather = SkiplanClient.weather('CHINAILLON')

    today_forecast = weather.forecasts['CHINAILLON']
    assert_equal '101' , today_forecast.weather_am
    assert_equal '101' , today_forecast.weather_pm
    assert_equal '+12' , today_forecast.temp_am
    assert_equal '+20' , today_forecast.temp_pm
    assert_equal '+4'  , today_forecast.temp_felt
    assert_equal '4'   , today_forecast.wind_speed
    assert_equal 'SE'  , today_forecast.wind_dir

    tomorrow_forecast = weather.forecasts['J+1']
    assert_equal '104' , tomorrow_forecast.weather_am
    assert_equal '106' , tomorrow_forecast.weather_pm
    assert_equal '+17' , tomorrow_forecast.temp_am
    assert_equal '+21' , tomorrow_forecast.temp_pm
    assert_equal '7'   , tomorrow_forecast.wind_speed
    assert_equal 'SO'  , tomorrow_forecast.wind_dir

    j2_forecast = weather.forecasts['J+2']
    assert_equal '106' , j2_forecast.weather_am
    assert_equal '104' , j2_forecast.weather_pm
    assert_equal '+12' , j2_forecast.temp_am
    assert_equal '+18' , j2_forecast.temp_pm
    assert_equal '7'   , j2_forecast.wind_speed
    assert_equal 'O'  , j2_forecast.wind_dir

    j3_forecast = weather.forecasts['J+3']
    assert_equal '101' , j3_forecast.weather_am
    assert_equal '103' , j3_forecast.weather_pm
    assert_equal '+16' , j3_forecast.temp_am
    assert_equal '+20' , j3_forecast.temp_pm
    assert_equal '7'   , j3_forecast.wind_speed
    assert_equal 'O'  , j3_forecast.wind_dir

    assert_equal '03/07/2014 17:01', weather.updated_at
  end

  should 'retrieve metrics data' do
    metrics = SkiplanClient.ski_area.metrics['GRAND BORNAND']

    assert_equal '0/44', metrics.alpine[:total]
    assert_equal '0/17', metrics.nordic[:total]
    assert_equal '35/47.5km', metrics.pedestrian[:total]
    assert_equal '0/61km', metrics.snowshoes[:total]
    assert_equal '0/4', metrics.sledge[:total]
    assert_equal '0/8', metrics.snowpark[:total]
  end

  should 'retrieve zones data' do
    zones = SkiplanClient.ski_area.zones

    assert_equal 10, zones.length
    assert_equal 'ALPIN CHINAILLON', zones.keys[0]

    ac_zone = zones['ALPIN CHINAILLON']
    assert_equal 10, ac_zone.skilifts.count
    assert_equal 16, ac_zone.slopes.count
    assert_equal 1, ac_zone.connections.count

    single_entry_zone = zones['PIETONS']
    assert_equal 1, single_entry_zone.slopes.count
  end

  should 'change config url' do
    config = SkiplanClient.configure('my_new_url')
    assert_equal 'my_new_url', config
  end

  should 'retrieve forecasts text messages' do
    texts = SkiplanClient.texts

    assert_equal 'Pluie. Vent faible variable.', texts[:fr]['today_forecast']
    assert_equal 'Beau temps sec et ensoleillé. Vent faible variable.', texts[:fr]['tomorrow_forecast']
    assert_equal 'Col de la Colombière ouvert.', texts[:fr]['forecasts_comment']
    assert_equal 'LE DOMAINE SKIABLE EST FERME POUR LA SAISON 2013/2014.', texts[:fr]['ski_area']
    assert_equal 'Routes degagees, circulation normale', texts[:fr]['conditions']
    assert_equal 'Non defini', texts[:fr]['roads']
    assert_equal 'Rain and snow. Variable winds, light at most places.', texts[:en]['today_forecast']
    assert_equal 'Dry and mostly sunny. Variable winds, light at most places.', texts[:en]['tomorrow_forecast']
    assert_equal 'Col de la Colombière open.', texts[:en]['forecasts_comment']
    assert_equal 'SKI AREA IS CLOSED FOR THE SEASON 2013/2014.', texts[:en]['ski_area']
    assert_equal 'Routes degagees, circulation normale', texts[:en]['conditions']
    assert_equal 'Non defini', texts[:en]['roads']
  end
end