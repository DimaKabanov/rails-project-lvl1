# frozen_string_literal: true

require_relative 'base'

module HexletCode
  # Creates an input tag
  class Input < Base
    def build
      type = attributes.fetch :type, :text
      input_attributes = { **attributes, type: type }
      Tag.build('input', input_attributes)
    end
  end
end
