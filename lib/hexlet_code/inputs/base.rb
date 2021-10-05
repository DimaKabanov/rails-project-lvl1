# frozen_string_literal: true

module HexletCode
  # Base data for inputs
  class Base
    attr_reader :attributes, :options

    def initialize(attributes, options)
      @attributes = attributes
      @options = options
    end
  end
end
