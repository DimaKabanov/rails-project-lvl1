# # frozen_string_literal: true

# # Creates form with inputs
# module FormHelper
#   class Form
#     def initialize(struct)
#       @struct = struct
#     end

#     def input(name, **kwargs)

#     end

#     def submit(value = 'Save')
#       Tag.build('submit', value: value, name: 'commit')
#     end
#   end

#   def form_for(struct, url: '#', &block)
#     form = Form.new struct
#     block.call form
#     Tag.build('form', action: url, method: 'post')
#   end
# end
