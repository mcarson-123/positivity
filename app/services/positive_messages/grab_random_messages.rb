module PositiveMessages
  module GrabRandomMessages

    extend self

    #
    # Grabs an array of input count number of messages from the database
    def call(count: 7)
      if count >= PositiveMessage.count
        return PositiveMessage.all.pluck(:id).shuffle
      end

      # Use inject to ensude we don't want duplicated
      (0...count).to_a.inject([]) { |memo, _| memo << grab_random_message_id(memo) }
    end

    private

    def grab_random_message_id(accumulator)
      message_id = nil
      while message_id.nil?
        # Want to include 1 to include the possibility of the most recent message
        somewhat_random_index = (PositiveMessage.count * Random.new.rand(0.0..1.0)).to_i
        # Need to check the message with the id exists
        m_id = PositiveMessage.find_by(id: somewhat_random_index).try(:id)

        # Ensure no duplicates
        message_id = m_id unless accumulator.include?(m_id)
      end
      message_id
    end
  end
end
