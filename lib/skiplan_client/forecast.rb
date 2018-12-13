# encoding: UTF-8
require 'skiplan_client/attribute_helper'

class Forecast

  include AttributeHelper

  def initialize(attributes)
    self.attributes = attributes
  end

  def updated_at
    @datemaj
  end

  def weather_am
    @CIEL_ID
  end

  def weather_pm
    @CIEL_ID_APM
  end

  def temp_am
    @TEMPERATURE
  end

  def temp_pm
    @TEMPERATURE_APM
  end

  def temp_felt
    @TEMPERATURE_RESSENTIE
  end

  def wind_speed
    @VENT
  end

  def wind_dir
    @DIRECTION
  end

  def avalanche
    @VALRISQUE
  end

  def snow_height
    @CUMUL
  end

  def last_fall
    @DERNIERE_CHUTE
  end

  def fresh_snow
    @NEIGE
  end

  def visibility
    @VISIBILITE
  end

  def snow_quality
    @QUALITE
  end

  def rain_snow_limit
    @LIMITE_PLUIE_NEIGE
  end
end