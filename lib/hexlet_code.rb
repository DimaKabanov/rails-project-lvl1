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

  def self.form_for(struct, options = {})
    form = Form.new
    form_render = FormRender.new(form, struct, options)
    yield form_render if block_given?
    form_render.render
  end
end
