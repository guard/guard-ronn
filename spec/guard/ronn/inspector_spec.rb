require 'spec_helper'

describe Guard::Ronn::Inspector do
  describe ".clean" do
    before do
      Dir.stub(:[]) { Dir.glob("spec/fixtures/*.{ronn,md,markdown}") }
    end

    it "removes non-ronn files 1" do
      subject.clean(["spec/fixtures/guard-ronn.ronn", "spec/fixtures/guard-ronn.html"]).should eq ["spec/fixtures/guard-ronn.ronn"]
    end

    it "removes non-markdown files 1" do
      subject.clean(["spec/fixtures/guard-ronn.md", "spec/fixtures/guard-ronn.html"]).should eq ["spec/fixtures/guard-ronn.md"]
    end

    it "removes non-markdown files 2" do
      subject.clean(["spec/fixtures/guard-ronn.markdown", "spec/fixtures/guard-ronn.html"]).should eq ["spec/fixtures/guard-ronn.markdown"]
    end

    it "removes non-existing files" do
      subject.clean(["spec/fixtures/guard-ronn.ronn", "spec/fixtures/guard-foo.ronn"]).should eq ["spec/fixtures/guard-ronn.ronn"]
    end

    it "removes duplication" do
      subject.clean(["spec/fixtures/guard-ronn.ronn", "spec/fixtures/guard-ronn.ronn"]).should eq ["spec/fixtures/guard-ronn.ronn"]
    end

  end
end
