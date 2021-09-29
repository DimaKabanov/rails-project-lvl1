# frozen_string_literal: true

require 'hexlet_code/version'
require 'hexlet_code/form'
require 'hexlet_code/tag'
require 'hexlet_code/inputs/base'
require 'hexlet_code/inputs/input'
require 'hexlet_code/inputs/text'
require 'hexlet_code/inputs/select'

module HexletCode
  class Error < StandardError; end

  def self.form_for(struct, options = {})
    form = Form.new struct
    yield form if block_given?

    action = options.fetch :action, '#'
    method = options.fetch :method, 'post'

    Tag.build('form', action: action, method: method) { form.tags.join }
  end
end
