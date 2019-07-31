module Ly
  module AppHelper
    include Util
    include Sinatra::Param

    JSON_HEADER_REGEX = /\Aapplication\/json/i

    PARAM_TYPE_BINDS = {
      :id => String,
      :name => String,
      :type => String
    }

    def required(*fields)
      fields.each do |f| 
        data_type = PARAM_TYPE_BINDS[f.to_sym]
        param(f, data_type, required: true) if data_type
      end

      params.keep_if { |k, _v| fields.include? k.to_sym }

      logger.info params
    end

    def get_body_raw
      @body_raw ||= request.body.read
    end

    def pickup_params
      if json_body?
        jbody = JSON.parse(get_body_raw)
        MnsLog.create_by(jbody) rescue halt(204)
        params.merge!(jbody['Message'] ? JSON.parse(jbody['Message']) : jbody)
      end

      logger.info "#{request.content_type} => #{params}"
    end

    def json_body?
      request.content_type&.match? JSON_HEADER_REGEX
    end

  end
end
