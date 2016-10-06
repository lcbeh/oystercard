class Journey
attr_reader :current_journey, :entry_station, :exit_station

MINIMUM_FARE = 1
PENALTY_FARE = 6

  def initialize
    @current_journey = []
    @entry_station = nil
    @exit_station = nil
  end

  def start(station)
    @entry_station = station
    @current_journey << station
  end

  def finish(station)
    @exit_station = station
    @current_journey << station
  end

  def incomplete?
    entry_station == nil || exit_station == nil
  end

  def fare
    return @fare = PENALTY_FARE if incomplete?
    @fare = MINIMUM_FARE
  end

end
