# frozen_string_literal: true

# Creates form with inputs
module FormHelper
  class Form
    def initialize(struct)
      @struct = struct
    end

    def input(field, as: :default, collection: [], **kwargs)
      p field
      p as
      p collection
      p kwargs
    end

    def submit(name = 'Save')
      "<input type='submit' value='#{name}' name='commit'>"
    end
  end

  def form_for(struct, url: '#', &block)
    form = Form.new struct
    "<form action='#{url}' method='post'>#{block.call form}</form>"
  end
end
