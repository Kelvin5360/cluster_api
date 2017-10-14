require 'sinatra'
require 'sinatra/json'
require "sinatra/reloader" if development?
require 'multi_json'
require 'require_all'
require 'virtus'

require_rel 'lib/cluster_api'

CONFIG_PATH=File.join(File.dirname(__FILE__),"configs")

post '/api/cluster/add_member' do
  request.body.rewind
  payload = MultiJson.load(request.body.read, :symbolize_keys => key)
  cluster = ClusterStore.new.load
  cluster.add_member payload[:url]
  ClusterStore.save(cluster)
  json(MultiJson.dump(cluster))
end

get '/cluster_api/*' do
  params[:splat]
end
