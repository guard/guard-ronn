# Guard::Ronn ![travis-ci](http://travis-ci.org/guard/guard-ronn.png)

Ronn guard automatically build manuals when markdown source files are modified.

## Compatibility

* Compatible with Ronn 0.7.3.
* Tested on Ruby 1.8.7, 1.9.2, REE, Rubinius & JRuby.

## Install

Please be sure to have [Guard](https://github.com/guard/guard) installed before continue.

If you're using Bundler, add it to your `Gemfile` (inside the `development` or `guard` group):

```ruby
gem 'guard-ronn'
```

and run:

```bash
$ bundle install
```

or manually install the gem:

```bash
$ gem install guard-ronn
```

Add Guard definition to your `Guardfile` by running this command:

```bash
$ guard init ronn
```

Usage
-----

Please read [Guard usage doc](https://github.com/guard/guard#readme)

By default, Guard::Ronn watch for files with the `.md` or `.markdown` extension in the `man` directory.

Guardfile
---------

``` ruby
guard 'ronn' do
  watch(%r{^man/.+\.m(ark)?d(own)?$})
end
```

Please read [Guard doc](https://github.com/guard/guard#readme) for more information about the Guardfile DSL.

Options
-------

You can pass any of the standard Ronn CLI options using the `:cli` option:

``` ruby
guard 'ronn', :cli => "--html" do
  # ...
end
```

### List of available options:

``` ruby
:cli => "-html"   # pass arbitrary Ronn CLI arguments, default: ""
:bundler => false # don't use "bundle exec" to run the Ronn command, default: true
```

Development
-----------

* Source hosted at [GitHub](https://github.com/guard/guard-ronn)
* Report issues/Questions/Feature requests on [GitHub Issues](https://github.com/guard/guard-ronn/issues)

Pull requests are very welcome! Make sure your patches are well tested. Please create a topic branch for every separate change you make. Also, please update the README and the CHANGELOG.

Testing
-------

`rake spec` and `rake spec:portability` (to test against multiple rubies).

Author
------

[Rémy Coutable](https://github.com/rymai)
