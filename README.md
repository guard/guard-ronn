# Guard::Ronn
[![Gem Version](https://badge.fury.io/rb/guard-ronn.png)](http://badge.fury.io/rb/guard-ronn) [![Build Status](https://travis-ci.org/guard/guard-ronn.png?branch=master)](https://travis-ci.org/guard/guard-ronn) [![Dependency Status](https://gemnasium.com/guard/guard-ronn.png)](https://gemnasium.com/guard/guard-ronn) [![Code Climate](https://codeclimate.com/github/guard/guard-ronn.png)](https://codeclimate.com/github/guard/guard-ronn) [![Coverage Status](https://coveralls.io/repos/guard/guard-ronn/badge.png?branch=master)](https://coveralls.io/r/guard/guard-ronn)

[Ronn](https://github.com/rtomayko/ronn) Guard plugin automatically build manuals when markdown source files are modified.

* Compatible with Ronn ~> 0.7.
* Tested against Ruby 1.9.3, 2.0.0, Rubinius & JRuby (1.9 mode only).

## Install

Please be sure to have [Guard](https://github.com/guard/guard) installed before continuing.

Add the gem to your Gemfile (inside the `:development` or `:tool` group):

``` ruby
group :development do
  gem 'guard-ronn'
end
```

Add guard definition to your Guardfile by running this command:

``` bash
$ guard init ronn
```

## Usage

Please read [Guard usage doc](https://github.com/guard/guard#readme).

By default, Guard::Ronn watch for files with the `.ronn`, `.md` or `.markdown` extension in the `man` directory.

## Guardfile

See the [template Guardfile](https://github.com/guard/guard-ronn/blob/master/lib/guard/ronn/templates/Guardfile) for some examples.

Please read the [Guard documentation](https://github.com/guard/guard#readme) for more info about the Guardfile DSL.

## Options

You can pass any of the standard Ronn CLI options using the `:cli` option:

``` ruby
guard 'ronn', cli: "--html" do
  # ...
end
```

### Available options

``` ruby
cli: '--html'  # pass arbitrary Ronn CLI arguments, default: ''
bundler: false # don't use "bundle exec" to run the Ronn command, default: true
```

## Bonus: reading gems' man pages from the `man` command

You can use the awesome [gem-man](https://github.com/defunkt/gem-man) by [defunkt](https://github.com/defunkt).

## Development

* Documentation hosted at [RubyDoc](http://rubydoc.info/gems/guard-ronn/frames).
* Source hosted at [GitHub](https://github.com/guard/guard-ronn).

Pull requests are very welcome! Please try to follow these simple rules if applicable:

* Please create a topic branch for every separate change you make.
* Make sure your patches are well tested. All specs must pass on [Travis CI](https://travis-ci.org/guard/guard-ronn).
* Update the [Yard](http://yardoc.org/) documentation.
* Update the [README](https://github.com/guard/guard-ronn/blob/master/README.md).
* Please **do not change** the version number.

For questions please join us in our [Google group](http://groups.google.com/group/guard-dev) or on
`#guard` (irc.freenode.net).

## Author

[Rémy Coutable](https://github.com/rymai) ([@rymai](http://twitter.com/rymai), [rym.ai](http://rym.ai))

## Contributors

[https://github.com/guard/guard-ronn/graphs/contributors](https://github.com/guard/guard-ronn/graphs/contributors)
