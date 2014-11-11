# encoding: UTF-8
require 'skiplan_client/attribute_helper'

class Metrics

  include AttributeHelper

  METRICS = ['SKI_NUIT', 'KM_SKATING', 'SKI_ALPIN', 'SKI_ALPIN_VERTES', 'SKI_ALPIN_BLEUES', 'SKI_ALPIN_ROUGES', 'SKI_ALPIN_NOIRES',
             'SKI_NORDIQUE', 'SKI_NORDIQUE_VERTES', 'SKI_NORDIQUE_BLEUES', 'SKI_NORDIQUE_ROUGES', 'SKI_NORDIQUE_NOIRES',
             'REMONTEES', 'PIETONS', 'RAQUETTES', 'LUGE', 'SNOWPARK']

  def initialize(attributes)
    self.attributes = attributes.keep_if {|k, v| METRICS.include?(k)} unless attributes.nil?
  end

  def alpine
    alpine_metrics = {}
    alpine_metrics[:total] = get_ratio(@SKI_ALPIN)
    alpine_metrics[:green] = get_ratio(@SKI_ALPIN_VERTES)
    alpine_metrics[:blue] = get_ratio(@SKI_ALPIN_BLEUES)
    alpine_metrics[:red] = get_ratio(@SKI_ALPIN_ROUGES)
    alpine_metrics[:black] = get_ratio(@SKI_ALPIN_NOIRES)

    alpine_metrics
  end

  def nordic
    nordic_metrics = {}
    nordic_metrics[:total] = get_ratio(@SKI_NORDIQUE)
    nordic_metrics[:green] = get_ratio(@SKI_NORDIQUE_VERTES)
    nordic_metrics[:blue] = get_ratio(@SKI_NORDIQUE_BLEUES)
    nordic_metrics[:red] = get_ratio(@SKI_NORDIQUE_ROUGES)
    nordic_metrics[:black] = get_ratio(@SKI_NORDIQUE_NOIRES)

    nordic_metrics
  end

  def pedestrian
    {:total => get_ratio_km(@PIETONS)}
  end

  def snowshoes
    {:total => get_ratio_km(@RAQUETTES)}
  end

  def sledge
    {:total => get_ratio(@LUGE)}
  end

  def snowpark
    {:total => get_ratio(@SNOWPARK)}
  end

  def skilifts
    {:total => get_ratio(@REMONTEES)}
  end

  def night_ski
    @SKI_NUIT && @SKI_NUIT['etat'] == '1'
  end

  def skating
    @KM_SKATING['ouvert'] unless @KM_SKATING.nil?
  end

  private

  def get_ratio(hash)
    "#{hash['ouvertes']}/#{hash['total']}" unless hash.nil?
  end

  def get_ratio_km(hash)
    "#{sprintf("%g", hash['lng_ouverts'].to_f)}/#{sprintf("%g", hash['lng_total'].to_f)}km" unless hash.nil?
  end
end