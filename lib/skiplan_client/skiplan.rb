class Skiplan

  attr_accessor :forecasts, :text_messages, :metrics, :zones

  def initialize
    @forecasts = {}
    @metrics = {}
    @zones = {}
    @text_messages = {}
  end
end