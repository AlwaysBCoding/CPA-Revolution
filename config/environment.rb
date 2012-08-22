# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
CpaMagic::Application.initialize!

class Numeric
  def roundup(nearest)
    self % nearest == 0 ? self : self + nearest - (self % nearest)
  end
end