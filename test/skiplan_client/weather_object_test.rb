# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client/weather_object'

class WeatherObjectTest < Test::Unit::TestCase

  should 'test information completed' do
    @weather_object = []
    hash_result = {:auj_ciel_id_matin => 'id_ciel_test1',
                   :auj_ciel_id_apm => 'id_ciel_test2',
                   :dem_ciel_id_matin => 'id_ciel_test3',
                   :dem_ciel_id_apm => 'id_ciel_test4'}

    @weather_object = WeatherObject.new(hash_result)

    assert_equal 'id_ciel_test1', @weather_object.auj_ciel_id_matin
    assert_equal 'id_ciel_test2', @weather_object.auj_ciel_id_apm
    assert_equal 'id_ciel_test3', @weather_object.dem_ciel_id_matin
    assert_equal 'id_ciel_test4', @weather_object.dem_ciel_id_apm

  end
end