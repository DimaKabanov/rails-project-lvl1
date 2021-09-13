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
User = Struct.new(:id, :name, :job)

user = User.new

html = HexletCode.form_for user, url: 'hello_world' do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts html

# <form action="hello_world" method="post">
#   <label for="user_name">Name</label>
#   <input id="user_name" name="user[name]" value="" type="text">
#   <label for="user_job">Job</label>
#   <textarea cols="20" rows="40" id="user_job" name="user[job]"></textarea>
#   <input type="submit" name="commit" value="Create">
# </form>
```
