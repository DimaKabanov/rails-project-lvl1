# frozen_string_literal: true

module HexletCode
  class Form
    attr_reader :tags, :struct

    def initialize(struct)
      @struct = struct
      @tags = []
    end

    def input(name, collection: [], **kwargs)
      input_type = kwargs.fetch :as, :input
      attributes = { **kwargs.except(:as), value: struct[name], name: name, id: name }
      options = { collection: collection }

      label = Tag.build('label', for: name) { name.capitalize }
      input = Inputs.const_get(input_type.to_s.capitalize).new(attributes, options).to_string

      tags << label
      tags << input
    end

    def submit(value = 'Save')
      submit = Tag.build('input', type: 'submit', value: value, name: 'commit')
      tags << submit
    end
  end
end
