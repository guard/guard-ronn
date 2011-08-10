require 'spec_helper'

describe Guard::Ronn::Inspector do
  describe ".clean" do
    before do
      Dir.stub(:[]) { Dir.glob("spec/fixtures/*.{md,markdown}") }
    end

    it "removes non-markdown files 1" do
      subject.clean(["spec/fixtures/guard-ronn.md", "spec/fixtures/guard-ronn.html"]).should == ["spec/fixtures/guard-ronn.md"]
    end

    it "removes non-markdown files 2" do
      subject.clean(["spec/fixtures/guard-ronn.md", "spec/fixtures/guard-ronn.html"]).should == ["spec/fixtures/guard-ronn.md"]
    end

    it "removes non-existing files" do
      subject.clean(["spec/fixtures/guard-ronn.md", "spec/fixtures/guard-foo.md"]).should == ["spec/fixtures/guard-ronn.md"]
    end

    it "removes duplication" do
      subject.clean(["spec/fixtures/guard-ronn.md", "spec/fixtures/guard-ronn.md"]).should == ["spec/fixtures/guard-ronn.md"]
    end

  end
end
