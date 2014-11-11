require 'skiplan_client/version'
require 'skiplan_client/forecast'
require 'skiplan_client/metrics'
require 'skiplan_client/zone'
require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

module SkiplanClient

  # Configuration defaults
  @config = {
      :base_url => 'http://www.skiplan.com/php/genererXml.php?pays=france&region=alpes&station=legrandbornand&v=1'
  }

  def self.configure(url)
    @config[:base_url] = url
  end

  def self.get_weather(zone)
    xml = Nokogiri::XML(open(@config[:base_url]))
    weather = Skiplan.new

    today_element = xml.xpath('//ZONE[@nom="' + zone + '"]')
    weather.forecasts['j'] = Forecast.new(Hash.from_xml(today_element.to_s)['ZONE'])

    tomorrow_element = xml.xpath('//ZONE[starts-with(@nom,"J+1") and @reference="' + zone + '"]')
    weather.forecasts['j+1'] = Forecast.new(Hash.from_xml(tomorrow_element.to_s)['ZONE'])

    j2_element = xml.xpath('//ZONE[starts-with(@nom,"J+2") and @reference="' + zone + '"]')
    weather.forecasts['j+2'] = Forecast.new(Hash.from_xml(j2_element.to_s)['ZONE'])

    j3_element = xml.xpath('//ZONE[starts-with(@nom,"J+3") and @reference="' + zone + '"]')
    weather.forecasts['j+3'] = Forecast.new(Hash.from_xml(j3_element.to_s)['ZONE'])

    metrics = xml.xpath('//INDICES')
    weather.metrics = Metrics.new(Hash.from_xml(metrics.to_s)['INDICES'])

    zones = xml.xpath('//SECTEUR')
    zones.each do |z|
      weather.zones[z['nom']] = Zone.new(Hash.from_xml(z.to_s)['SECTEUR'])
    end

    weather
  end
end