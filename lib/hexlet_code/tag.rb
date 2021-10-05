# frozen_string_literal: true

require_relative 'tags/single_tag'
require_relative 'tags/paired_tag'

module HexletCode
  # Creates tag markup
  module Tag
    def self.build(tag_name, attributes, &block)
      if block_given?
        PairedTag.new(tag_name, attributes, &block).to_string
      else
        SingleTag.new(tag_name, attributes).to_string
      end
    end
  end
end
