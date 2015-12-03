require 'skiplan_client/attribute_helper'

class Zone

  include AttributeHelper

  def initialize(attributes)
    normalized_attrs = attributes.dup
    normalized_attrs['REMONTEE'] = [normalized_attrs['REMONTEE']] if normalized_attrs['REMONTEE'].is_a?(Hash)
    normalized_attrs['PISTE'] = [normalized_attrs['PISTE']] if normalized_attrs['PISTE'].is_a?(Hash)
    normalized_attrs['Liaison'] = [normalized_attrs['Liaison']] if normalized_attrs['Liaison'].is_a?(Hash)
    self.attributes = normalized_attrs
  end

  def name
    @nom
  end

  def skilifts
    @REMONTEE
  end

  def slopes
    @PISTE
  end

  def connections
    @Liaison
  end

  def ratio(array_field = [])
    open_entries = array_field.select {|r| r['etat'] == 'O'}
    "#{open_entries.length}/#{array_field.length}"
  end
end