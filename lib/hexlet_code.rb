# frozen_string_literal: true

require 'hexlet_code/version'

module HexletCode
  autoload :Form, 'hexlet_code/form'
  autoload :Tag, 'hexlet_code/tag'
  autoload :Inputs, 'hexlet_code/inputs'

  class Error < StandardError; end

  def self.form_for(struct, options = {})
    form = Form.new struct
    yield form if block_given?

    action = options.fetch :action, '#'
    method = options.fetch :method, 'post'

    Tag.build('form', action: action, method: method) { form.tags.join }
  end
end
