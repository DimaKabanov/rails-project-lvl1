# frozen_string_literal: true

module HexletCode
  class Node
    attr_reader :tag_name, :attributes, :body

    def initialize(tag_name, attributes)
      @tag_name = tag_name
      @attributes = attributes
      @body = yield if block_given?
    end

    def attributes_as_line
      attributes.to_a.map { |(key, value)| "#{key}=\"#{value}\"" }.join ' '
    end
  end
end
