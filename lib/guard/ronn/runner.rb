module Guard
  class Ronn
    class Runner

      attr_reader :notifier

      def initialize(options = {})
        @options  = options
        @notifier = Notifier.new
      end

      def run(paths, options = {})
        return false if paths.empty?

        options = @options.merge(options)
        message = options[:message] || "Running: #{paths.join(' ')}"

        ::Guard::UI.info(message, reset: true)

        result = system(ronn_command(paths, options))

        @notifier.notify(result)
      end

      private

      def ronn_command(paths, options = {})
        cmd_parts = []
        cmd_parts << 'bundle exec' if bundler? && options[:bundler] != false
        cmd_parts << 'ronn'
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
