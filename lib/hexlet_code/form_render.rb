# frozen_string_literal: true

module HexletCode
  # Creates a form tag
  module FormRender
    def self.render(form, options)
      yield form if block_given?

      action = options.fetch :action, '#'
      method = options.fetch :method, 'post'
      # p form.tags.join
      Tag.build('form', action: action, method: method) { form.tags.join }
    end
  end
end
