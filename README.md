# CsTemplate

## Base template for kickstarting an application.

### Includes
- 7-1 pattern file structure
- Bourbon
- Neat
- Base styles for...
  - Typography
  - Colors
  - Mixins
  - Headers
  - Footers
  - Buttons
  - Forms
  - Tables
  - Lists
  - Sections
  - Login Screens
  - Night Themes

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cs_template'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cs_template

## Usage

### Install

`cs_template install`
- Generates all SCSS files in your project
- Skips over any existing directories that match the 7-1 pattern
  - Example. If you already have a vendor directory, it will not destroy it and create a new one.
- Installs the SCSS from Bourbon and Neat in your vendor directory

### Destroy

`cs_template destroy`
- Wipes out every directory and file matching the 7-1 pattern

This is useful if you just want to install the template for temporary use. Do not
use this if you wish to only delete select files in each directory. This wipes
everything.

## Development

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/havok2905/cs_template.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
