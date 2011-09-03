require 'spec_helper'

describe Guard::Ronn do
  before do
    Dir.stub(:[]) { Dir.glob("spec/fixtures/*.{ronn,md,markdown}") }
  end
  let(:default_options) { {} }
  subject { Guard::Ronn.new }

  describe '#start' do
    it "displays an initial message" do
      Guard::UI.should_receive(:info).with("Guard::Ronn is running, with Ronn #{::Ronn.version}!")
      subject.start
    end
  end

  describe "#run_all" do
    it "build all manuals" do
      Guard::Ronn::Runner.should_receive(:run).with(["man/*"], default_options.merge(:message => "Building all manuals"))
      subject.run_all
    end

    it "directly passes :cli option to runner" do
      subject = Guard::Ronn.new([], { :cli => "--html" })
      Guard::Ronn::Runner.should_receive(:run).with(["man/*"], default_options.merge(:message => "Building all manuals", :cli => "--html"))
      subject.run_all
    end
  end

  describe "#run_on_change" do
    it "runs Ronn with paths" do
      Guard::Ronn::Runner.should_receive(:run).with(["spec/fixtures/guard-ronn.md"], default_options)
      subject.run_on_change(["spec/fixtures/guard-ronn.md"])
    end

    it "directly passes :cli option to runner" do
      subject = Guard::Ronn.new([], { :cli => "--html" })
      Guard::Ronn::Runner.should_receive(:run).with(["spec/fixtures/guard-ronn.md"], default_options.merge(:cli => "--html"))
      subject.run_on_change(["spec/fixtures/guard-ronn.md"])
    end
  end

end
