require 'guard/compat/test/helper'
require 'guard/ronn'

describe Guard::Ronn do
  let(:options) { {} }
  let(:guard_plugin) { Guard::Ronn.new(options) }

  before do
    allow(Dir).to receive(:[]) { Dir.glob('spec/fixtures/*.{ronn,md,markdown}') }
  end

  describe '#initialize' do
    let(:options) { { cli: '--html' } }

    it 'passes options to runner' do
      expect(Guard::Ronn::Runner).to receive(:new).with(cli: '--html')

      guard_plugin
    end
  end

  describe '#start' do
    it 'displays an initial message' do
      expect(Guard::Compat::UI).to receive(:info).with("Guard::Ronn is running, with Ronn #{::Ronn.version}!")

      guard_plugin.start
    end
  end

  describe '#run_all' do
    it 'build all manuals' do
      expect(guard_plugin.runner).to receive(:run).with(
        ['spec/fixtures/guard-ronn.ronn', 'spec/fixtures/guard-ronn.md', 'spec/fixtures/guard-ronn.markdown'],
        message: 'Building all manuals')

      guard_plugin.run_all
    end
  end

  describe '#run_on_changes' do
    it 'runs Ronn with paths' do
      expect(guard_plugin.runner).to receive(:run).with(['spec/fixtures/guard-ronn.md'])

      guard_plugin.run_on_changes(['spec/fixtures/guard-ronn.md'])
    end
  end

end
