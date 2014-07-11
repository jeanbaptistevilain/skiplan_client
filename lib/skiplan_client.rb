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
    auj_temp_matin  = xml.xpath('//ZONE[@nom="CHINAILLON"]/TEMPERATURE').text
    auj_temp_apm    = xml.xpath('//ZONE[@nom="CHINAILLON"]/TEMPERATURE_APM').text
    auj_temp_rst    = xml.xpath('//ZONE[@nom="CHINAILLON"]/TEMPERATURE_RESSENTIE').text
    auj_vent_kmh    = xml.xpath('//ZONE[@nom="CHINAILLON"]/VENT').text
    auj_vent_dir    = xml.xpath('//ZONE[@nom="CHINAILLON"]/DIRECTION').text
    auj_vit_rafales = xml.xpath('//ZONE[@nom="CHINAILLON"]/RAFALES').text
    auj_visibilite  = xml.xpath('//ZONE[@nom="CHINAILLON"]/VISIBILITE').text
    meteo_jour      = xml.xpath('//JOUR/LANGUE[@val="fr"]').text
    ciel_id_dem_mat = xml.xpath('//ZONE[@nom="J+1"]/CIEL_ID').text
    ciel_id_dem_apm = xml.xpath('//ZONE[@nom="J+1"]/CIEL_ID_APM').text
    dem_temp_matin  = xml.xpath('//ZONE[@nom="J+1"]/TEMPERATURE').text
    dem_temp_apm    = xml.xpath('//ZONE[@nom="J+1"]/TEMPERATURE_APM').text
    dem_vent_kmh    = xml.xpath('//ZONE[@nom="J+1"]/VENT').text
    dem_vent_dir    = xml.xpath('//ZONE[@nom="J+1"]/DIRECTION').text
    dem_vit_rafales = xml.xpath('//ZONE[@nom="J+1"]/RAFALES').text
    dem_visibilite  = xml.xpath('//ZONE[@nom="J+1"]/VISIBILITE').text
    meteo_lendemain = xml.xpath('//LENDEMAIN/LANGUE[@val="fr"]').text
    j2_mat_ciel_id  = xml.xpath('//ZONE[@nom="J+2"]/CIEL_ID').text
    j2_apm_ciel_id  = xml.xpath('//ZONE[@nom="J+2"]/CIEL_ID_APM').text
    j2_temp_matin   = xml.xpath('//ZONE[@nom="J+2"]/TEMPERATURE').text
    j2_temp_apm     = xml.xpath('//ZONE[@nom="J+2"]/TEMPERATURE_APM').text
    j2_vent_kmh     = xml.xpath('//ZONE[@nom="J+2"]/VENT').text
    j2_vent_dir     = xml.xpath('//ZONE[@nom="J+2"]/DIRECTION').text
    j2_vit_rafales  = xml.xpath('//ZONE[@nom="J+2"]/RAFALES').text
    j2_visibilite   = xml.xpath('//ZONE[@nom="J+2"]/VISIBILITE').text
    j3_mat_ciel_id  = xml.xpath('//ZONE[@nom="J+3"]/CIEL_ID').text
    j3_apm_ciel_id  = xml.xpath('//ZONE[@nom="J+3"]/CIEL_ID_APM').text
    j3_temp_matin   = xml.xpath('//ZONE[@nom="J+3"]/TEMPERATURE').text
    j3_temp_apm     = xml.xpath('//ZONE[@nom="J+3"]/TEMPERATURE_APM').text
    j3_vent_kmh     = xml.xpath('//ZONE[@nom="J+3"]/VENT').text
    j3_vent_dir     = xml.xpath('//ZONE[@nom="J+3"]/DIRECTION').text
    j3_vit_rafales  = xml.xpath('//ZONE[@nom="J+3"]/RAFALES').text
    j3_visibilite   = xml.xpath('//ZONE[@nom="J+3"]/VISIBILITE').text
    meteo_semaine   = xml.xpath('//SEMAINE/LANGUE[@val="fr"]').text


    @info = WeatherObject.new( :auj_ciel_id_matin => ciel_id_auj_mat,
                               :auj_ciel_id_apm   => ciel_id_auj_apm,
                               :dem_ciel_id_matin => ciel_id_dem_mat,
                               :dem_ciel_id_apm   => ciel_id_dem_apm,
                               :auj_temp_matin    => auj_temp_matin,
                               :auj_temp_apm      => auj_temp_apm,
                               :dem_temp_matin    => dem_temp_matin,
                               :dem_temp_apm      => dem_temp_apm,
                               :auj_temp_rst      => auj_temp_rst,
                               :auj_vent_kmh      => auj_vent_kmh,
                               :auj_vent_dir      => auj_vent_dir,
                               :auj_vit_rafales   => auj_vit_rafales,
                               :visibilite        => auj_visibilite,
                               :meteo_jour        => meteo_jour,
                               :dem_vent_kmh      => dem_vent_kmh,
                               :dem_vent_dir      => dem_vent_dir,
                               :dem_vit_rafales   => dem_vit_rafales,
                               :dem_visibilite    => dem_visibilite,
                               :meteo_lendemain   => meteo_lendemain,
                               :j2_mat_ciel_id    => j2_mat_ciel_id,
                               :j2_apm_ciel_id    => j2_apm_ciel_id,
                               :j2_temp_matin     => j2_temp_matin,
                               :j2_temp_apm       => j2_temp_apm,
                               :j2_vent_kmh       => j2_vent_kmh,
                               :j2_vent_dir       => j2_vent_dir,
                               :j2_vit_rafales    => j2_vit_rafales,
                               :j2_visibilite     => j2_visibilite,
                               :j3_mat_ciel_id    => j3_mat_ciel_id,
                               :j3_apm_ciel_id    => j3_apm_ciel_id,
                               :j3_temp_matin     => j3_temp_matin,
                               :j3_temp_apm       => j3_temp_apm,
                               :j3_vent_kmh       => j3_vent_kmh,
                               :j3_vent_dir       => j3_vent_dir,
                               :j3_vit_rafales    => j3_vit_rafales,
                               :j3_visibilite     => j3_visibilite,
                               :meteo_semaine     => meteo_semaine)
    @info
  end
end