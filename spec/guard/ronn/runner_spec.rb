require 'spec_helper'

describe Guard::Ronn::Runner do

  describe ".run" do
    before(:each) do
      subject.stub(:notify)
    end

    context "when passed an empty paths list" do
      it "returns false" do
        subject.run([]).should be_false
      end
    end

    context "in a folder without Bundler" do
      before(:each) do
        Dir.stub(:pwd).and_return(@fixture_path.join("empty"))
      end

      it "runs" do
        subject.should_receive(:system).with(
          "ronn man/*"
        )
        subject.run(["man/*"])
      end
    end

    context "in a folder with Bundler" do
      before(:each) do
        Dir.stub(:pwd).and_return(@fixture_path)
      end

      it "runs with Bundler" do
        subject.should_receive(:system).with("bundle exec ronn man/*")
        subject.run(["man/*"])
      end

      describe "options" do
        describe ":cli" do
          it "runs with CLI options passed to Ronn" do
            subject.should_receive(:system).with("bundle exec ronn --html man/*")
            subject.run(["man/*"], :cli => "--html")
          end
        end

        describe ":bundler" do
          it "runs without Bundler with bundler option to false" do
            subject.should_receive(:system).with("ronn man/*")
            subject.run(["man/*"], :bundler => false)
          end
        end
      end
    end

    describe "result message" do
      describe "calls notify when manuals build is finished" do
        it "with true when build succeeds" do
          subject.should_receive(:system).with("bundle exec ronn man/*") { true }
          subject.should_receive(:notify).with(true)
          subject.run(["man/*"])
        end

        it "with false when build succeeds" do
          subject.should_receive(:system).with("bundle exec ronn man/*") { false }
          subject.should_receive(:notify).with(false)
          subject.run(["man/*"])
        end
      end
    end
  end

end
