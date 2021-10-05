# frozen_string_literal: true

require 'hexlet_code/version'

# Creates form markup
module HexletCode
  autoload :Form, 'hexlet_code/form'
  autoload :FormRender, 'hexlet_code/form_render'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Inputs, 'hexlet_code/inputs'

  class Error < StandardError; end

  def self.form_for(struct, options = {}, &block)
    form = Form.new struct
    FormRender.render(form, options, &block)
  end
end
