module Ly
  class Base < ActiveRecord::Base
    self.abstract_class = true

    include Util
  end
end