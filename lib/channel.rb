class Channel
  # Add more fields as needed
  attr_reader :name
  def initialize(name)
    @name = name
  end

  # This is a factory method! It reads the data
  # we got back from the API, and turns it into
  # an instance of Channel by calling self.new
  def self.from_api(raw_channel)
    self.new(raw_channel["name"])
  end
end
