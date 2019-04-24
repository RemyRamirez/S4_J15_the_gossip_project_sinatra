require 'sinatra'
require 'gossip'

class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
end

class ApplicationController < Sinatra::Base
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    erb :new_gossip
    redirect '/'
  end
end

class ApplicationController < Sinatra::Base
  get '/gossips/:id' do
    erb :show, locals: {gossip: Gossip.find(params[:id])}
    
  end

end

