require "#{File.dirname(__FILE__)}/formatter"

module Guard
  class Ronn
    module Runner
      class << self
        include Formatter

        def run(paths, options={})
          return false if paths.empty?
          message = options[:message] || "Running: #{paths.join(' ')}"
          UI.info(message, :reset => true)
          success = system(ronn_command(paths, options))
          notify(success)
        end

      private

        def ronn_command(paths, options={})
          cmd_parts = []
          cmd_parts << "bundle exec" if bundler? && options[:bundler] != false
          cmd_parts << "ronn"
          cmd_parts << options[:cli] if options[:cli]
          cmd_parts << paths.join(' ')

          cmd_parts.join(' ')
        end

        def bundler?
          @bundler ||= File.exist?("#{Dir.pwd}/Gemfile")
        end

      end
    end
  end
end
