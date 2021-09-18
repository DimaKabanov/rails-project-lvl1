# frozen_string_literal: true

# Creates form with inputs
module FormHelper
  class Form
    def initialize(struct)
      @struct = struct
    end

    def input(field, as: :default, collection: [])
      p field
      p as
      p collection
    end
  end

  def form_for(struct, url: '#', &block)
    form = Form.new struct
    "<form action='#{url}' method='post'>#{block.call form}</form>"
  end
end
