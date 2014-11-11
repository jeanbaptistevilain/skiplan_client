# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client/forecast'

class ForecastTest < Test::Unit::TestCase

  should 'populate forecast with attributes values' do
    forecast = Forecast.new({'datemaj' => '03/07/2014 17:01:18',
                             'TEMPERATURE' => '+10',
                             'TEMPERATURE_APM' => '+14',
                             'TEMPERATURE_RESSENTIE' => '+4',
                             'VENT' => '4',
                             'DIRECTION' => 'S',
                             'CIEL_ID' => '101',
                             'CIEL_ID_APM' => '101',
                             'VALRISQUE' => '3',
                             'CUMUL' => '100',
                             'NEIGE' => '20',
                             'DERNIERE_CHUTE' => '22/04/2014 08:31',
                             'VISIBILITE' => '100'})

    assert_equal '03/07/2014 17:01:18', forecast.updated_at
    assert_equal '101', forecast.weather_am
    assert_equal '101', forecast.weather_pm
    assert_equal '+10', forecast.temp_am
    assert_equal '+14', forecast.temp_pm
    assert_equal '+4', forecast.temp_felt
    assert_equal '4', forecast.wind_speed
    assert_equal 'S', forecast.wind_dir
    assert_equal '3', forecast.avalanche
    assert_equal '100', forecast.snow_height
    assert_equal '22/04/2014 08:31', forecast.last_fall
    assert_equal '20', forecast.fresh_snow
    assert_equal '100', forecast.visibility
  end
end