require_relative 'journey'

class Oystercard

attr_reader :balance, :entry_station, :exit_station, :journey_log, :current_journey

LIMIT = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 1

    def initialize
      @balance = 0
      @limit = LIMIT
      @journey_log = []
    end

    def in_journey?
      !!entry_station
    end

    def top_up(amount)
      fail "Balance cannot exceed #{LIMIT}, cannot top up" if @balance + amount > LIMIT
      @balance += amount
    end

    def touch_in(entry_station)
      fail "Insufficent balance" if balance < MINIMUM_BALANCE
      @current_journey = Journey.new
      @current_journey.start(entry_station)
      # @entry_station = entry_station
    end

    def touch_out(exit_station)
      @current_journey = Journey.new if @current_journey.nil?
      @current_journey.finish(exit_station)
      deduct(current_journey.fare)
      # journey
      @entry_station = nil
      @exit_station = nil
    end

    def journey
      @journey_log << { entry_station: entry_station, exit_station: exit_station }
    end

  private
  def deduct(fare)
    @balance -= fare
  end
end
