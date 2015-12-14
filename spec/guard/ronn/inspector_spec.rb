require 'guard/compat/test/helper'
require 'guard/ronn/inspector'

describe Guard::Ronn::Inspector do

  describe '.clean' do
    before do
      allow(Dir).to receive(:[]) { Dir.glob('spec/fixtures/*.{ronn,md,markdown}') }
    end

    it 'removes non-ronn files 1' do
      expect(subject.clean(['spec/fixtures/guard-ronn.ronn', 'spec/fixtures/guard-ronn.html'])).to eq ['spec/fixtures/guard-ronn.ronn']
    end

    it 'removes non-markdown files 1' do
      expect(subject.clean(['spec/fixtures/guard-ronn.md', 'spec/fixtures/guard-ronn.html'])).to eq ['spec/fixtures/guard-ronn.md']
    end

    it 'removes non-markdown files 2' do
      expect(subject.clean(['spec/fixtures/guard-ronn.markdown', 'spec/fixtures/guard-ronn.html'])).to eq ['spec/fixtures/guard-ronn.markdown']
    end

    it 'removes non-existing files' do
      expect(subject.clean(['spec/fixtures/guard-ronn.ronn', 'spec/fixtures/guard-foo.ronn'])).to eq ['spec/fixtures/guard-ronn.ronn']
    end

    it 'removes duplication' do
      expect(subject.clean(['spec/fixtures/guard-ronn.ronn', 'spec/fixtures/guard-ronn.ronn'])).to eq ['spec/fixtures/guard-ronn.ronn']
    end
  end

end
