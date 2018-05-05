require 'test_helper'

describe Channel do
  it "raises an error if does not have two parameters" do
    proc {
      Channel.new
    }.must_raise ArgumentError

    proc {
      Channel.new "Name"
    }.must_raise ArgumentError
  end

  it "Must initialize name & id properly" do
    channel = Channel.new("Name", "ID")
    channel.name.must_equal "Name"
    channel.id.must_equal "ID"
  end
end
