# frozen_string_literal: true

module HexletCode
  # Creates tag markup
  class Tag
    def self.build(tag_name, attributes, &block)
      single_tags = %w[input textarea]
      attributes_line = attributes_as_line attributes

      if single_tags.include? tag_name
        single_tag(tag_name, attributes_line)
      else
        paired_tag(tag_name, attributes_line, &block)
      end
    end

    def self.paired_tag(tag_name, attributes)
      "<#{tag_name}#{attributes}>#{yield}</#{tag_name}>"
    end

    def self.single_tag(tag_name, attributes)
      "<#{tag_name}#{attributes}>"
    end

    def self.attributes_as_line(attributes)
      attributes.to_a.map { |(key, value)| " #{key}=\"#{value}\"" }.join
    end
  end
end
