# myapp.rb
# require 'sinatra'

# require 'sinatra/base'

require 'bundler'
Bundler.require :default

module Ly
	class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :test, :development do
      register Sinatra::Reloader
    end

    logger filename: "log/#{settings.environment}.log", level: :info

    before do
      ActiveRecord::Base.logger = logger
    end


		get '/' do
		  'Hello world!'
		end

    not_found do
      status 404
  		"page not found"
    end

		error do
		  'Sorry there was a error - ' + env['sinatra.error'].messageend
		end

	end

end

