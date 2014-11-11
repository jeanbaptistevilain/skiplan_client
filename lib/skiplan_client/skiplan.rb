class Skiplan

  attr_accessor :forecasts, :metrics, :zones

  def initialize
    @forecasts = {}
    @zones = {}
  end
end