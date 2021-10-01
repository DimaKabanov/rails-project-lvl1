# frozen_string_literal: true

module HexletCode
  module FormRender
    def self.render(form, options)
      yield form if block_given?

      action = options.fetch :action, '#'
      method = options.fetch :method, 'post'

      Tag.build('form', action: action, method: method) { form.tags.join }
    end
  end
end
