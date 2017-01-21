module PositiveMessages
  module AddMessagesFromFile
    #
    # This service is a helper to be used in the Rails console to quickly add positive messages
    # to the database.
    #
    # The file should include one message per line.
    # Easiest to add new messages to the beginnging of the file and
    # pass end_line arg as the line number of the last new line to include


    extend self

    def call(file_name:, end_line: nil)
      File.foreach(file_name).with_index do |line, i|
        break if end_line && i >= end_line
        next if line.strip.blank?
        PositiveMessage.create(message_text: line.strip, enabled_state: :enabled)
      end
    end
  end
end
