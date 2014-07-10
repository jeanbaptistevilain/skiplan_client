require 'skiplan_client/version'
require 'open-uri'
require 'nokogiri'

module SkiplanClient

  # Configuration defaults
  @config = {
      :base_url => 'http://www.skiplan.com/php/genererXml.php?pays=france&region=alpes& station=legrandbornand&v=1'
  }

  def self.configure(url)
    @config[:base_url] = url
  end

  def self.get_weather
    @info = []

    xml = Nokogiri::XML(open(@config[:base_url]))

    ciel_id_auj_mat = xml.xpath('//ZONE[@nom="CHINAILLON"]/CIEL_ID').text
    ciel_id_auj_apm = xml.xpath('//ZONE[@nom="CHINAILLON"]/CIEL_ID_APM').text
    ciel_id_dem_mat = xml.xpath('//ZONE[@nom="J+1"]/CIEL_ID').text
    ciel_id_dem_apm = xml.xpath('//ZONE[@nom="J+1"]/CIEL_ID_APM').text
    auj_temp_matin = xml.xpath('//ZONE[@nom="CHINAILLON"]/TEMPERATURE').text
    auj_temp_apm = xml.xpath('//ZONE[@nom="CHINAILLON"]/TEMPERATURE_APM').text
    dem_temp_matin = xml.xpath('//ZONE[@nom="J+1"]/TEMPERATURE').text
    dem_temp_apm = xml.xpath('//ZONE[@nom="J+1"]/TEMPERATURE_APM').text

    @info = WeatherObject.new(:auj_ciel_id_matin => ciel_id_auj_mat,
                               :auj_ciel_id_apm => ciel_id_auj_apm,
                               :dem_ciel_id_matin => ciel_id_dem_mat,
                               :dem_ciel_id_apm => ciel_id_dem_apm,
                               :auj_temp_matin => auj_temp_matin,
                               :auj_temp_apm => auj_temp_apm,
                               :dem_temp_matin => dem_temp_matin,
                               :dem_temp_apm => dem_temp_apm)
    @info
  end
end