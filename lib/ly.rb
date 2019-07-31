
module Ly
  module Util
    def root_path
      File.expand_path('..', __dir__)
    end

    def log(msg)
      puts "%s => %s" % [ Time.now, msg ]
    end
  end
end
