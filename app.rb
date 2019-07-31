
require 'bundler'
Bundler.require :default

require_relative 'lib/ly'
require_relative 'models/base'
%w[models helpers].each do |dir|
  Dir.glob(dir + '/**/*.rb').each { |mod| require_relative mod }
end

module Ly
	class App < Sinatra::Base
    register Sinatra::ActiveRecordExtension

    configure :test, :development do
      register Sinatra::Reloader
    end

    logger filename: "log/#{settings.environment}.log", level: :info

    helpers AppHelper

    before do
      ActiveRecord::Base.logger = logger
      get_body_raw if %w[POST].include?(request.request_method)
      pickup_params
    end

    set :environments, %w[test development production]
    set :bind,         '0.0.0.0'

		get '/' do
		  'Hello world!'
		end

    post '/book/create' do
      # required :_id, :name, :descript, :type
			required :name, :type
      Book.create_by(params)

      halt 204
    end

   	get '/book/show' do
      # required :_id, :name, :descript, :type
			required :id
      book = Book.find_by_id(params[:id].to_i)

      halt 204
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

