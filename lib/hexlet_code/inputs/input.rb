# frozen_string_literal: true

require_relative 'base'

module HexletCode
  module Inputs
    class Input < Base
      def to_string
        Tag.build('input', attributes)
      end
    end
  end
end
