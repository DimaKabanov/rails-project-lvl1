# frozen_string_literal: true

require_relative 'test_helper'
require_relative '../lib/hexlet_code'

def get_fixture_path(name)
  File.join(__dir__, 'fixtures', name)
end

class FormGeneratorTest < Minitest::Test
  def setup
    user = Struct.new(:name, :email, :job, :gender, keyword_init: true)
    @user = user.new name: 'rob', email: 'test@mail.com', job: 'hexlet', gender: 'm'
  end

  def test_render_form
    actual_form = HexletCode.form_for @user do |f|
      f.input :name, class: 'input-text'
      f.input :email, type: :email
      f.input :job, as: :text
      f.input :gender, as: :select, collection: %w[m f]
      f.submit
    end

    html_path = get_fixture_path('form.html')
    expected_form = File.read(html_path)

    assert_equal actual_form, expected_form
  end

  def test_render_form_without_types
    actual_form = HexletCode.form_for @user do |f|
      f.input :name
      f.submit
    end

    html_path = get_fixture_path('form_without_types.html')
    expected_form = File.read(html_path)

    assert_equal actual_form, expected_form
  end

  def test_render_custom_submit
    actual_form = HexletCode.form_for @user do |f|
      f.submit 'Submit'
    end

    html_path = get_fixture_path('custom_submit.html')
    expected_form = File.read(html_path)

    assert_equal actual_form, expected_form
  end
end
