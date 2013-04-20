module Guard
  class Ronn
    module Formatter

      def notify(success)
        ::Guard::Notifier.notify(guard_message(success), :title => 'Ronn results', :image => guard_image(success))
      end

    private

      def guard_message(success)
        success ? 'Manual generation done!' : 'Manual generation failed!'
      end

      # failed | success
      def guard_image(success)
        success ? :success : :failed
      end

    end
  end
end