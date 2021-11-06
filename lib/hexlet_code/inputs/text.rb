# frozen_string_literal: true

require_relative 'base'

module HexletCode
  # Creates a textarea tag
  class Text < Base
    def build
      cols = attributes.fetch :cols, 20
      rows = attributes.fetch :rows, 40
      textarea_attributes = { **attributes, cols: cols, rows: rows }
      Tag.build('textarea', textarea_attributes)
    end
  end
end
