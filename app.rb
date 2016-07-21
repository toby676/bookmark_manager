require 'sinatra/base'
require_relative 'data_mapper_setup.rb'

class Bookmarks < Sinatra::Base

  get '/' do
    'HELLO YOU'
  end

  get '/links' do
    @links = Link.all
    erb :'links/index'
  end

  get '/links/new' do
    erb :'links/new_link'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])

    params[:tags].split.each do |tag|
      link.tags << Tag.first_or_create(name: tag)
    end

    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  run! if app_file == $0
end
