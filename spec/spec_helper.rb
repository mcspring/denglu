require 'rspec'
require 'denglu'

RSpec.configure do |config|
  config.include RSpec::Matchers

  config.mock_with :rspec
end


# Setup spec app config
module Denglu

  Config.app_id = '43669den56kf1gxRCmfn7UBW5kevQ3'
  Config.app_key = '458394366Cr0ppwALx71Sx9m2f8jm6'

end
