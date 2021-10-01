# HexletCode

[![Ruby](https://github.com/DimaKabanov/rails-project-lvl1/actions/workflows/master.yml/badge.svg)](https://github.com/DimaKabanov/rails-project-lvl1/actions/workflows/master.yml)
[![hexlet-check](https://github.com/DimaKabanov/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/DimaKabanov/rails-project-lvl1/actions/workflows/hexlet-check.yml)

Simple form generator

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

```console
$ bundle install
```

Or install it yourself as:

```console
$ gem install hexlet_code
```

## Usage

See Example

## Example

```ruby
User = Struct.new(:name, :email, :job, :gender, keyword_init: true)
user = User.new name: 'rob', email: 'user@mail.com', job: 'hexlet', gender: 'm'

html = HexletCode.form_for user do |f|
  f.input :name, class: 'input-text'
  f.input :email, type: :email
  f.input :job, as: :text
  f.input :gender, as: :select, collection: %w[m f]
  f.submit
end

puts html

# <form action="#" method="post">
#     <label for="name">Name</label>
#     <input class="input-text" value="rob" name="name" id="name" type="text">
#     <label for="email">Email</label>
#     <input type="email" value="user@mail.com" name="email" id="email">
#     <label for="job">Job</label>
#     <textarea value="hexlet" name="job" id="job" cols="20" rows="40">
#     <label for="gender">Gender</label>
#     <select name="gender" id="gender">
#         <option value="m" selected="true">m</option>
#         <option value="f">f</option>
#     </select>
#     <input type="submit" value="Save" name="commit">
# </form>
```

