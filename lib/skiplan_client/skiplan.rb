class Skiplan

  attr_accessor :forecasts, :text_messages, :metrics, :zones, :updated_at

  def initialize(updated_at)
    @updated_at = updated_at
    @forecasts = {}
    @metrics = {}
    @zones = {}
    @text_messages = {}
  end
end