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

    skiplan
  end

  def self.ski_area
    xml = Nokogiri::XML(open(@config[:base_url]))
    skiplan = Skiplan.new

    area_metrics = xml.xpath('//INDICES')
    area_metrics.each do |area|
      skiplan.metrics[area['nom']] = Metrics.new(Hash.from_xml(area.to_s)['INDICES'])
    end

    zones = xml.xpath('//SECTEUR')
    zones.each do |z|
      skiplan.zones[z['nom']] = Zone.new(Hash.from_xml(z.to_s)['SECTEUR'])
    end

    skiplan
  end

  def self.texts
    xml = Nokogiri::XML(open(@config[:base_url]))
    {
        fr: SkiplanClient.localized_texts(xml, 'fr'),
        en: SkiplanClient.localized_texts(xml, 'en')
    }
  end

  private

  def self.localized_texts(xml, locale)
    text_messages = {}

    today_forecast = xml.xpath('//BULLETINS//JOUR//LANGUE[@val="' + locale + '"]')
    text_messages['today_forecast'] = Hash.from_xml(today_forecast.to_s)['LANGUE']

    tomorrow_forecast = xml.xpath('//BULLETINS//LENDEMAIN//LANGUE[@val="' + locale + '"]')
    text_messages['tomorrow_forecast'] = Hash.from_xml(tomorrow_forecast.to_s)['LANGUE']

    forecasts_comment = xml.xpath('//BULLETINS//COMMENTAIRES//LANGUE[@val="' + locale + '"]')
    text_messages['forecasts_comment'] = Hash.from_xml(forecasts_comment.to_s)['LANGUE']

    ski_area_comment = xml.xpath('//INDICES//COMMENTAIRES//LANGUE[@val="' + locale + '"]')
    text_messages['ski_area'] = Hash.from_xml(ski_area_comment.to_s)['LANGUE']

    conditions_comment = xml.xpath('//INDICES//ETAT_ROUTE')
    text_messages['conditions'] = Hash.from_xml(conditions_comment.to_s)['ETAT_ROUTE']['lib']

    roads_comment = xml.xpath('//INDICES//ETAT_CHAUSSEE')
    text_messages['roads'] = Hash.from_xml(roads_comment.to_s)['ETAT_CHAUSSEE']['lib']

    text_messages
  end
end