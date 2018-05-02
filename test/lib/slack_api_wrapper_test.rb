require 'test_helper'

describe SlackApiWrapper do
  describe 'list_channels' do
    it 'gives a list of channels' do
      # channels is the name of the cassette file
      VCR.use_cassette('channels') do
        channels = SlackApiWrapper.list_channels

        channels.each do |channel|
          channel.must_be_kind_of Channel
        end
      end
    end

    it 'throws an error if the auth is bad' do
      skip "beyond our scope, don't worry about this for API Muncher"
    end
  end

  describe 'send_message' do
    it 'sends a message to a real channel' do
      VCR.use_cassette('channels') do
        message = 'test message'
        channel = 'test-api-channel'

        SlackApiWrapper.send_message(channel, message)
      end
    end

    it 'raises an error when you send a message to a channel that DNE' do
      VCR.use_cassette('channels') do
        message = 'test message'
        channel = 'this-channel-dne-dont-create-this-channel-please'

        proc {
          SlackApiWrapper.send_message(channel, message)
        }.must_raise SlackApiWrapper::SlackError
      end
    end

    it 'raises an error with an empty message' do
      skip 'left as an exercise to the reader'
    end

    it 'raises an error with an empty channel name' do
      skip 'left as an exercise to the reader'
    end
  end
end
