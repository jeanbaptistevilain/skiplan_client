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

    jour = 'Soleil et ciel bleu pr??dominent. Vent variable faible. Cette nuit : Nuit ??toil??e, puis d??gradation nuageuse en fin de nuit.En fin de nuit vent de sud-est mod??r?? dans le Pays du Mont Blanc. Sur les autres r??gions, vent plus faible.'
    dem = 'Temps nuageux ?? tr??s nuageux, averses parfois orageuses en journ??e. En d??but de matin??e, vent de sud-est soufflant mod??r??ment dans le Pays du Mont Blanc, avec des rafales atteignant 55 km/h; puis att??nuation. Ailleurs, vent plus faible.'
    semaine = ""

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
    assert_equal '+4'  , weather.auj_temp_rst
    assert_equal '4'   , weather.auj_vent_kmh
    assert_equal 'SE'  , weather.auj_vent_dir
    assert_equal '0'   , weather.auj_vit_rafales
    assert_equal '100' , weather.visibilite
    assert_equal jour  , weather.meteo_jour
    assert_equal '+17' , weather.dem_temp_matin
    assert_equal '+21' , weather.dem_temp_apm
    assert_equal '7'   , weather.dem_vent_kmh
    assert_equal 'SO'  , weather.dem_vent_dir
    assert_equal '0'   , weather.dem_vit_rafales
    assert_equal '100' , weather.dem_visibilite
    assert_equal dem   , weather.meteo_lendemain
    assert_equal '106' , weather.j2_mat_ciel_id
    assert_equal '104' , weather.j2_apm_ciel_id
    assert_equal '+12' , weather.j2_temp_matin
    assert_equal '+18' , weather.j2_temp_apm
    assert_equal '7'   , weather.j2_vent_kmh
    assert_equal 'O'   , weather.j2_vent_dir
    assert_equal '0'   , weather.j2_vit_rafales
    assert_equal '100' , weather.j2_visibilite
    assert_equal '101' , weather.j3_mat_ciel_id
    assert_equal '103' , weather.j3_apm_ciel_id
    assert_equal '+16' , weather.j3_temp_matin
    assert_equal '+20' , weather.j3_temp_apm
    assert_equal '7'   , weather.j3_vent_kmh
    assert_equal 'O'   , weather.j3_vent_dir
    assert_equal '0'   , weather.j3_vit_rafales
    assert_equal '100' , weather.j3_visibilite
    assert_equal ''    , weather.meteo_semaine

  end

  should 'change config url' do

    config = SkiplanClient.configure('http://api.openweathermap.org/data/2.5/forecast/daily?q=tokyo&mode=xml&units=metric&cnt=1')

    assert_equal 'http://api.openweathermap.org/data/2.5/forecast/daily?q=tokyo&mode=xml&units=metric&cnt=1', config
  end

end