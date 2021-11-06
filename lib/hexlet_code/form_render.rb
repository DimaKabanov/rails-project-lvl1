# frozen_string_literal: true

module HexletCode
  # Creates a form tag
  class FormRender
    attr_reader :form, :struct, :options

    def initialize(form, struct, options)
      @form = form
      @struct = struct
      @options = options
    end

    def build_label(name)
      form.tags << Tag.build('label', for: name) { name.capitalize }
    end

    def input(name, collection: [], **kwargs)
      build_label(name)

      input_type = kwargs.fetch :as, :input
      input_attributes = { **kwargs.except(:as), value: struct[name], name: name, id: name }
      input_options = { collection: collection }

      input = HexletCode.const_get(input_type.to_s.capitalize).new(input_attributes, input_options).build

      form.tags << input
    end

    def submit(value = 'Save')
      submit = Tag.build('input', type: 'submit', value: value, name: 'commit')
      form.tags << submit
    end

    def render
      action = options.fetch :action, '#'
      method = options.fetch :method, 'post'

      Tag.build('form', action: action, method: method) { form.tags.join }
    end
  end
end
