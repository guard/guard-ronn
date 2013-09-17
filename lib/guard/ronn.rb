require 'guard'
require 'guard/plugin'
require 'ronn'

module Guard
  class Ronn < Plugin
    require 'guard/ronn/runner'
    require 'guard/ronn/inspector'
    require 'guard/ronn/notifier'

    attr_reader :runner

    def initialize(options = {})
      super
      @runner = Runner.new(@options)
    end

    # Call once when guard starts
    def start
      UI.info "Guard::Ronn is running, with Ronn #{::Ronn.version}!"
    end

    def run_all
      @runner.run(Inspector.ronn_files, message: 'Building all manuals')
    end

    def run_on_changes(paths)
      @runner.run(Inspector.clean(paths))
    end

  end
end
