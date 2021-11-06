# frozen_string_literal: true

require 'hexlet_code/version'

# Creates form markup
module HexletCode
  autoload :Form, 'hexlet_code/form'
  autoload :FormRender, 'hexlet_code/form_render'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Input, 'hexlet_code/inputs/input'
  autoload :Text, 'hexlet_code/inputs/text'
  autoload :Select, 'hexlet_code/inputs/select'

  class Error < StandardError; end

  def self.form_for(struct, options = {}, &block)
    form = Form.new struct
    FormRender.render(form, options, &block)
  end
end
