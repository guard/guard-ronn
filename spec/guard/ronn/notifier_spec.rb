require 'spec_helper'

describe Guard::Ronn::Notifier do

  describe '#notify' do
    describe 'true is passed' do
      it 'calls the guard notifier with a success message' do
        Guard::Notifier.should_receive(:notify).with('Manual generation done!',
                                                     :title => 'Ronn results',
                                                     :image => :success)
        described_class.new.notify(true)
      end
    end

    describe 'false is passed' do
      it 'calls the guard notifier with a failing message' do
        Guard::Notifier.should_receive(:notify).with('Manual generation failed!',
                                                     :title => 'Ronn results',
                                                     :image => :failed)
        described_class.new.notify(false)
      end
    end
  end

end
