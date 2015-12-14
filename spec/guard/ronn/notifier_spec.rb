require 'guard/compat/test/helper'
require 'guard/ronn/notifier'

describe Guard::Ronn::Notifier do

  describe '#notify' do
    describe 'true is passed' do
      it 'calls the guard notifier with a success message' do
        expect(Guard::Compat::UI).to receive(:notify).with('Manual generation done!',
                                                     title: 'Ronn results',
                                                     image: :success)
        described_class.new.notify(true)
      end
    end

    describe 'false is passed' do
      it 'calls the guard notifier with a failing message' do
        expect(Guard::Compat::UI).to receive(:notify).with('Manual generation failed!',
                                                     title: 'Ronn results',
                                                     image: :failed)
        described_class.new.notify(false)
      end
    end
  end

end
