# frozen_string_literal: true

require 'hexlet_code/version'

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

def build_label(attributes, &body)
  "<label #{attributes}>#{body.call}</label>"
end

module HexletCode
  class Error < StandardError; end

  module Tag
    def self.build(tag_name, attributes, &body)
      attr = make_attributes attributes

      builders = {
        br: -> { build_br attr },
        img: -> { build_img attr },
        input: -> { build_input attr },
        label: -> { build_label attr, &body }
      }

      builders[tag_name.to_sym].call
    end
  end

  def self.form_for(url: '#')
    "<form action='#{url}' method='post'></form>"
  end
end
