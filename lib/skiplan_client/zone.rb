require 'skiplan_client/attribute_helper'

class Zone

  include AttributeHelper

  def initialize(attributes)
    self.attributes = attributes
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

  def ratio(array_field = [])
    open_entries = array_field.select {|r| r['etat'] == 'O'}
    "#{open_entries.length}/#{array_field.length}"
  end
end