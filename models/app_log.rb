module Ly
  class AppLog < Base
    def self.warn(msg)
      create! ex_msg: msg, ex_type: :warn
    end

    def self.error(ex, context = {})
      create! ex_klass: ex.class.name, ex_msg: ex.message, ex_type: :error, ex_context: context.to_json
    end

    def self.call_raise(ex, context = {})
      error(ex, context)
      raise ex
    end
  end
end