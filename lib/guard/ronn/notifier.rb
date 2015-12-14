module Guard
  class Ronn < Plugin
    class Notifier

      def notify(result)
        @result = result

        Guard::Compat::UI.notify(guard_message, title: 'Ronn results',
                                                image: guard_image)
      end

      private

      def guard_message
        @result ? 'Manual generation done!' : 'Manual generation failed!'
      end

      def guard_image
        @result ? :success : :failed
      end

    end
  end
end
