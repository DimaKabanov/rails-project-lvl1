# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Inputs
    class Text < Base
      def to_string
        cols = attributes.fetch :cols, 20
        rows = attributes.fetch :rows, 40
        textarea_attributes = { **attributes, cols: cols, rows: rows }
        Tag.build('textarea', textarea_attributes)
      end
    end
  end
end
