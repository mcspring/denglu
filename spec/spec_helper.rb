require 'rspec'
require 'denglu'

RSpec.configure do |config|
  config.include RSpec::Matchers

  config.mock_with :rspec
end


module Denglud

  Config.app_id = ''
  Config.app_key = ''

end
