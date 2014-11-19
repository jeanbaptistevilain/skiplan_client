# encoding : UTF-8
require 'rubygems'
gem 'shoulda'
require 'test/unit'
require 'shoulda'
require 'skiplan_client/metrics'

class MetricsTest < Test::Unit::TestCase
  
  setup do
    attributes = {'ETAT_ROUTE' => {'lib' => "Routes dégagées, circulation normale"},
                  'ETAT_CHAUSSEE' => {'val' => '0', 'lib' => "Dégagées et sèches"},
                  'SKI_NUIT' => {'etat' => '1'},
                  'KM_SKATING' => {'ouvert' => '10'},
                  'SKI_ALPIN'=>{'total'=>'44', 'total_periode'=>'44', 'total_periode_hpf'=>'44', 'ouvertes_previsions'=>'0', 'ouvertes'=>'10', 'previsions'=>'0', 'fermees'=>'44', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0'},
                  'SKI_ALPIN_VERTES'=>{'total'=>'12', 'total_periode'=>'12', 'total_periode_hpf'=>'12', 'ouvertes_previsions'=>'0', 'ouvertes'=>'2', 'previsions'=>'0', 'fermees'=>'12', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0'},
                  'SKI_ALPIN_BLEUES'=>{'total'=>'15', 'total_periode'=>'15', 'total_periode_hpf'=>'15', 'ouvertes_previsions'=>'0', 'ouvertes'=>'3', 'previsions'=>'0', 'fermees'=>'15', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0'},
                  'SKI_ALPIN_ROUGES'=>{'total'=>'14', 'total_periode'=>'14', 'total_periode_hpf'=>'14', 'ouvertes_previsions'=>'0', 'ouvertes'=>'4', 'previsions'=>'0', 'fermees'=>'14', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0'},
                  'SKI_ALPIN_NOIRES'=>{'total'=>'3', 'total_periode'=>'3', 'total_periode_hpf'=>'3', 'ouvertes_previsions'=>'0', 'ouvertes'=>'1', 'previsions'=>'0', 'fermees'=>'3', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0'},
                  'SKI_NORDIQUE'=>{'total'=>'17', 'total_periode'=>'17', 'total_periode_hpf'=>'17', 'ouvertes_previsions'=>'0', 'ouvertes'=>'6', 'previsions'=>'0', 'fermees'=>'17', 'lng_total'=>'67.9', 'lng_ouverts'=>'0.0'},
                  'SKI_NORDIQUE_VERTES'=>{'total'=>'7', 'total_periode'=>'7', 'total_periode_hpf'=>'7', 'ouvertes_previsions'=>'0', 'ouvertes'=>'2', 'previsions'=>'0', 'fermees'=>'7', 'lng_total'=>'5.9', 'lng_ouverts'=>'0.0'},
                  'SKI_NORDIQUE_BLEUES'=>{'total'=>'4', 'total_periode'=>'4', 'total_periode_hpf'=>'4', 'ouvertes_previsions'=>'0', 'ouvertes'=>'3', 'previsions'=>'0', 'fermees'=>'4', 'lng_total'=>'20.9', 'lng_ouverts'=>'0.0'},
                  'SKI_NORDIQUE_ROUGES'=>{'total'=>'3', 'total_periode'=>'3', 'total_periode_hpf'=>'3', 'ouvertes_previsions'=>'0', 'ouvertes'=>'1', 'previsions'=>'0', 'fermees'=>'3', 'lng_total'=>'18.5', 'lng_ouverts'=>'0.0'},
                  'SKI_NORDIQUE_NOIRES'=>{'total'=>'3', 'total_periode'=>'3', 'total_periode_hpf'=>'3', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'3', 'lng_total'=>'22.6', 'lng_ouverts'=>'0.0'},
                  'REMONTEES' => {'total'=>'32', 'total_periode'=>'32', 'total_periode_hpf'=>'32', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'32'},
                  'PIETONS'=>{'total'=>'12', 'total_periode'=>'12', 'total_periode_hpf'=>'12', 'ouvertes_previsions'=>'9', 'ouvertes'=>'9', 'previsions'=>'0', 'fermees'=>'3', 'lng_total'=>'47.5', 'lng_ouverts'=>'35.0'},
                  'RAQUETTES'=>{'total'=>'14', 'total_periode'=>'14', 'total_periode_hpf'=>'14', 'ouvertes_previsions'=>'0', 'ouvertes'=>'1', 'previsions'=>'0', 'fermees'=>'14', 'lng_total'=>'61.0', 'lng_ouverts'=>'0.0'},
                  'LUGE'=>{'total'=>'4', 'total_periode'=>'4', 'total_periode_hpf'=>'4', 'ouvertes_previsions'=>'0', 'ouvertes'=>'2', 'previsions'=>'0', 'fermees'=>'4', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0'},
                  'SNOWPARK'=>{'total'=>'8', 'total_periode'=>'8', 'total_periode_hpf'=>'8', 'ouvertes_previsions'=>'0', 'ouvertes'=>'3', 'previsions'=>'0', 'fermees'=>'8', 'lng_total'=>'0.0', 'lng_ouverts'=>'0.0',
                               'BIGAIR'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'BOX'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'CHILLZONE'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'HALFPIPE'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'HIP'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'AIRBAG'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'KICKER'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'QUATERPIPE'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'RAIL'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'STEPUP'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'WATERSLIDE'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'WHOOPS'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'BOARDERCROSS'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'VIDEOZONE'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'},
                               'SPEEDZONE'=>{'total'=>'0', 'total_periode'=>'0', 'total_periode_hpf'=>'0', 'ouvertes_previsions'=>'0', 'ouvertes'=>'0', 'previsions'=>'0', 'fermees'=>'0'}}}
    @metrics = Metrics.new(attributes)
  end

  should 'return metrics for alpine slopes' do
    assert_equal '10/44', @metrics.alpine[:total]
    assert_equal '2/12', @metrics.alpine[:green]
    assert_equal '3/15', @metrics.alpine[:blue]
    assert_equal '4/14', @metrics.alpine[:red]
    assert_equal '1/3', @metrics.alpine[:black]
  end

  should 'return metrics for nordic slopes' do
    assert_equal '6/17', @metrics.nordic[:total]
    assert_equal '2/7', @metrics.nordic[:green]
    assert_equal '3/4', @metrics.nordic[:blue]
    assert_equal '1/3', @metrics.nordic[:red]
    assert_equal '0/3', @metrics.nordic[:black]
    assert_equal '0/67.9km', @metrics.nordic[:km]
  end

  should 'return metrics for pedestrians' do
    assert_equal '35/47.5km', @metrics.pedestrian[:total]
  end

  should 'return metrics for snowshoes' do
    assert_equal '0/61km', @metrics.snowshoes[:total]
  end

  should 'return metrics for sledges' do
    assert_equal '2/4', @metrics.sledge[:total]
  end

  should 'return metrics for snowparks' do
    assert_equal '3/8', @metrics.snowpark[:total]
  end

  should 'return metrics for skilifts' do
    assert_equal '0/32', @metrics.skilifts[:total]
  end

  should 'return night ski availability for current day' do
    assert_equal true, @metrics.night_ski
  end

  should 'return skating km available' do
    assert_equal '10', @metrics.skating
  end

  should 'return a detailed status for the driving conditions' do
    assert_equal 'Routes dégagées, circulation normale', @metrics.driving_conditions
  end

  should 'return a detailed status for the roads' do
    assert_equal 'Dégagées et sèches', @metrics.roads
  end
end