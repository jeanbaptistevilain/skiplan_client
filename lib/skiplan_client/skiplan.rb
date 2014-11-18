class Skiplan

  attr_accessor :forecasts, :text_forecasts, :metrics, :zones

  def initialize
    @forecasts = {}
    @zones = {}
    @text_forecasts = {}
  end
end