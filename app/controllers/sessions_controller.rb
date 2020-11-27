class SessionsController < ApplicationController

  # GET: /login
  get "/login" do
    erb :"/sessions/index.html"
  end

  # POST: /sessions
  post "/sessions" do
    login(params[:email], params[:password])
    redirect '/trucks'
  end

  get '/logout' do
    logout!
    redirect '/trucks'
  end
end
