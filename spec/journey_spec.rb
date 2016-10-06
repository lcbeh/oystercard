require 'journey'

describe Journey do
let (:card) {double :card}
let (:station) {double :station}

  it "initialize with entry_station set to nil" do
    journey = Journey.new
    expect(journey.entry_station).to eq nil
  end

  it "initialize with exit_station set to nil" do
    journey = Journey.new
    expect(journey.exit_station).to eq nil
  end

  it "starts a journey" do
    expect(subject.start(station)).to eq [station]
  end

  it "finishes a journey" do
    expect(subject.finish(station)).to eq [station]
  end

  it "return minimum fare if complete" do
    subject.start(station)
    subject.finish(station)
    expect(subject.fare).to eq Journey::MINIMUM_FARE
  end

  it "returns penalty fare if no touch_in" do
    subject.start(station)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "returns penalty fare if no touch_out" do
    subject.finish(station)
    expect(subject.fare).to eq Journey::PENALTY_FARE
  end

  it "checks if the journey is complete" do
    subject.start(station)
    expect(subject).to be_incomplete
  end

  it "checks if the journey is complete" do
    subject.finish(station)
    expect(subject).to be_incomplete
  end


end
