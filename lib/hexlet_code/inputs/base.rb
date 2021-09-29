# frozen_string_literal: true

module HexletCode
  class Base
    attr_reader :attributes, :options

    def initialize(attributes, options)
      @attributes = attributes
      @options = options
    end
  end
end
