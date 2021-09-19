# frozen_string_literal: true

require 'hexlet_code/version'
# require 'hexlet_code/helpers'

def make_attributes(attributes)
  attributes.to_a.map { |(key, value)| "#{key}='#{value}'" }.join ' '
end

def build_br(attributes)
  "<br #{attributes}>"
end

def build_img(attributes)
  "<img #{attributes}>"
end

def build_input(attributes)
  "<input #{attributes}>"
end

def build_submit(attributes)
  "<submit #{attributes}>"
end

def build_label(attributes, &body)
  "<label #{attributes}>#{body.call}</label>"
end

def build_textarea(attributes, &body)
  "<textarea #{attributes}>#{body.call}</textarea>"
end

def build_select(attributes, &body)
  "<select #{attributes}>#{body.call}</select>"
end

def build_option(attributes, &body)
  "<option #{attributes}>#{body.call}</option>"
end

module HexletCode
  # extend FormHelper

  class Error < StandardError; end

  module Tag
    def self.build(tag_name, attributes, &body)
      attr = make_attributes attributes

      builders = {
        br: -> { build_br attr },
        img: -> { build_img attr },
        input: -> { build_input attr },
        submit: -> { build_submit attr },
        label: -> { build_label attr, &body },
        textarea: -> { build_textarea attr, &body },
        select: -> { build_select attr, &body },
        option: -> { build_option attr, &body }
      }

      builders[tag_name.to_sym].call
    end
  end

  class Form
    attr_reader :tags

    def initialize(struct)
      @struct = struct
      @tags = []
    end

    def input(field, as: :default, collection: [], **kwargs)
      label = Tag.build('label', for: field) { field.capitalize }
      input = case as
              when :default
                attr = { type: 'text', value: @struct[field], name: field, id: field }
                Tag.build('input', attr.merge(kwargs))
              when :text
                attr = { name: field, id: field }
                Tag.build('textarea', attr.merge(kwargs)) { @struct[field] }
              when :select
                attr = { name: field, id: field }
                options = collection.map { |item| Tag.build('option', value: @struct[field], selected: item == @struct[field]) { @struct[field] } }
                Tag.build('select', attr.merge(kwargs)) { options.join }
              end

      tags << label
      tags << input
    end

    def submit(value = 'Save')
      submit = Tag.build('submit', value: value, name: 'commit')
      tags << submit
    end
  end

  def self.form_for(struct, url: '#', &block)
    form = Form.new struct
    block.call form
    "<form action='#{url}' method='post'>#{form.tags.join}</form>"
  end
end
