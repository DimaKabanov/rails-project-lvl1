# frozen_string_literal: true

require_relative 'node'

module HexletCode
  class SingleTag < Node
    def to_string
      "<#{tag_name} #{attributes_as_line}>"
    end
  end
end
