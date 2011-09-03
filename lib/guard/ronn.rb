require 'guard'
require 'guard/guard'
require 'ronn'

module Guard
  class Ronn < Guard
    autoload :Runner,    'guard/ronn/runner'
    autoload :Inspector, 'guard/ronn/inspector'
    autoload :Formatter, 'guard/ronn/formatter'

    def initialize(watchers=[], options={})
      super
      @options = {
      }.merge(options)
    end

    # Call once when guard starts
    def start
      UI.info "Guard::Ronn is running, with Ronn #{::Ronn.version}!"
    end

    def run_all
      Runner.run(["man/*"], @options.merge(:message => "Building all manuals"))
    end

    def run_on_change(paths)
      Runner.run(Inspector.clean(paths), @options)
    end

  end
end
