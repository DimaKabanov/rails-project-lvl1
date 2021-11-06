# frozen_string_literal: true

require_relative 'base'

module HexletCode
  # Creates a select tag
  class Select < Base
    def build
      select_attributes = attributes.except :value
      select_options = options[:collection].map do |option|
        option_attributes = { value: option }
        option_attributes[:selected] = true if option == attributes[:value]
        Tag.build('option', option_attributes) { option }
      end.join
      Tag.build('select', select_attributes) { select_options }
    end
  end
end
