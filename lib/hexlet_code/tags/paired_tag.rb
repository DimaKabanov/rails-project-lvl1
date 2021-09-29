# frozen_string_literal: true

require_relative 'node'

module HexletCode
  class PairedTag < Node
    def to_string
      "<#{tag_name} #{attributes_as_line}>#{body}</#{tag_name}>"
    end
  end
end
