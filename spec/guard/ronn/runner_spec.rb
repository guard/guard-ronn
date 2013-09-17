require 'spec_helper'

describe Guard::Ronn::Runner do
  let(:runner) { described_class.new }

  describe '#run' do
    before do
      runner.notifier.stub(:notify)
    end

    context 'when passed an empty paths list' do
      it 'returns false' do
        runner.run([]).should be_false
      end
    end

    context 'in a folder without Bundler' do
      before do
        Dir.stub(:pwd).and_return(@fixture_path.join('empty'))
      end

      it 'runs' do
        runner.should_receive(:system).with('ronn man/*')

        runner.run(['man/*'])
      end
    end

    context 'in a folder with Bundler' do
      before do
        Dir.stub(:pwd).and_return(@fixture_path)
      end

      it 'runs with Bundler' do
        runner.should_receive(:system).with('bundle exec ronn man/*')

        runner.run(['man/*'])
      end

      describe 'options' do
        describe ':cli' do
          it 'runs with CLI options passed to Ronn' do
            runner.should_receive(:system).with('bundle exec ronn --html man/*')

            runner.run(['man/*'], cli: '--html')
          end
        end

        describe ':bundler' do
          it 'runs without Bundler with bundler option to false' do
            runner.should_receive(:system).with('ronn man/*')

            runner.run(['man/*'], bundler: false)
          end
        end
      end
    end

    describe 'result message' do
      describe 'calls notify when manuals build is finished' do
        it 'with true when build succeeds' do
          runner.should_receive(:system).with('bundle exec ronn man/*') { true }
          runner.notifier.should_receive(:notify).with(true)

          runner.run(['man/*'])
        end

        it 'with false when build succeeds' do
          runner.should_receive(:system).with('bundle exec ronn man/*') { false }
          runner.notifier.should_receive(:notify).with(false)

          runner.run(['man/*'])
        end
      end
    end
  end

end
