if ENV['CI']
  require 'coveralls'
  Coveralls.wear!
end

ENV['GUARD_ENV'] = 'test'
require 'guard/ronn'

RSpec.configure do |config|
  config.filter_run focus: ENV['CI'] != 'true'
  config.run_all_when_everything_filtered = true
  config.treat_symbols_as_metadata_keys_with_true_values = true

  config.before(:each) do
    @fixture_path = Pathname.new(File.expand_path('../fixtures/', __FILE__))
    @lib_path     = Pathname.new(File.expand_path('../../lib/', __FILE__))

    # Stub all UI methods, so no visible output appears for the UI class
    ::Guard::UI.stub(:info)
    ::Guard::UI.stub(:warning)
    ::Guard::UI.stub(:error)
    ::Guard::UI.stub(:debug)
    ::Guard::UI.stub(:deprecation)
  end
end
