require 'guard/compat/test/helper'
require 'guard/ronn/runner'

describe Guard::Ronn::Runner do
  let(:runner) { described_class.new }

  before do
    allow(Guard::Compat::UI).to receive(:info)
  end

  describe '#run' do
    before do
      allow(runner.notifier).to receive(:notify)
    end

    context 'when passed an empty paths list' do
      it 'returns false' do
        expect(runner.run([])).to be false
      end
    end

    context 'in a folder without Bundler' do
      before do
        allow(Dir).to receive(:pwd) { @fixture_path.join('empty') }
      end

      it 'runs' do
        expect(runner).to receive(:system).with('ronn man/*')

        runner.run(['man/*'])
      end
    end

    context 'in a folder with Bundler' do
      before do
        allow(Dir).to receive(:pwd) { @fixture_path }
      end

      it 'runs with Bundler' do
        expect(runner).to receive(:system).with('bundle exec ronn man/*')

        runner.run(['man/*'])
      end

      describe 'options' do
        describe ':cli' do
          it 'runs with CLI options passed to Ronn' do
            expect(runner).to receive(:system).with('bundle exec ronn --html man/*')

            runner.run(['man/*'], cli: '--html')
          end
        end

        describe ':bundler' do
          it 'runs without Bundler with bundler option to false' do
            expect(runner).to receive(:system).with('ronn man/*')

            runner.run(['man/*'], bundler: false)
          end
        end
      end
    end

    describe 'result message' do
      describe 'calls notify when manuals build is finished' do
        it 'with true when build succeeds' do
          expect(runner).to receive(:system).with('bundle exec ronn man/*') { true }
          expect(runner.notifier).to receive(:notify).with(true)

          runner.run(['man/*'])
        end

        it 'with false when build succeeds' do
          expect(runner).to receive(:system).with('bundle exec ronn man/*') { false }
          expect(runner.notifier).to receive(:notify).with(false)

          runner.run(['man/*'])
        end
      end
    end
  end

end
