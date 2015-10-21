require 'skiplan_client/version'
require 'skiplan_client/forecast'
require 'skiplan_client/metrics'
require 'skiplan_client/zone'
require 'skiplan_client/skiplan'
require 'open-uri'
require 'nokogiri'
require 'active_support/core_ext/hash/conversions'

module SkiplanClient

  # Configuration defaults
  @config = {
      :base_url => ''
  }

  def self.configure(url)
    @config[:base_url] = url
  end

  def self.weather(zone)
    xml = Nokogiri::XML(open(@config[:base_url]))
    skiplan = Skiplan.new

    zone_nodes = xml.xpath('//ZONE[@reference="' + zone + '"]')
    zone_nodes.each do |n|
      skiplan.forecasts[n['nom']] = Forecast.new(Hash.from_xml(n.to_s)['ZONE'])
    end

    today_forecast = xml.xpath('//BULLETINS//JOUR//LANGUE[@val="fr"]')
    skiplan.text_messages['today_forecast'] = Hash.from_xml(today_forecast.to_s)['LANGUE']

    forecasts_comment = xml.xpath('//BULLETINS//COMMENTAIRES//LANGUE[@val="fr"]')
    skiplan.text_messages['forecasts_comment'] = Hash.from_xml(forecasts_comment.to_s)['LANGUE']

    skiplan
  end

  def self.ski_area
    xml = Nokogiri::XML(open(@config[:base_url]))
    skiplan = Skiplan.new

    area_metrics = xml.xpath('//INDICES')
    area_metrics.each do |area|
      skiplan.metrics[area['nom']] = Metrics.new(Hash.from_xml(area.to_s)['INDICES'])
      slopes_comment = area.xpath('.//COMMENTAIRES//LANGUE[@val="fr"]')
      skiplan.text_messages[area['nom']] ||= {}
      skiplan.text_messages[area['nom']]['slopes_comment'] = Hash.from_xml(slopes_comment.to_s)['LANGUE']
    end

    zones = xml.xpath('//SECTEUR')
    zones.each do |z|
      skiplan.zones[z['nom']] = Zone.new(Hash.from_xml(z.to_s)['SECTEUR'])
    end

    skiplan
  end
end