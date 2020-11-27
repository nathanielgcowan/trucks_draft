class TrucksController < ApplicationController

  get '/trucks' do 
    @trucks = Truck.all 
    erb :"trucks/index.html"
  end

  get '/trucks/new' do
    if current_user 
      erb :"trucks/new.html" 
    else 
      redirect "/login"
    end
  end

  post '/trucks' do 
    #{"model"=>"model of truck", "make"=>"make of truck"}
    @truck = Truck.new
    @truck.model = params[:model]
    @truck.make = params[:make]
    # this is already created
    @truck.user_id = session[:id]
    if @truck.save
      redirect "/trucks/#{@truck.id}"
    else
      erb :"trucks/new.html"
    end
  end 

  get '/trucks/:id' do 
    @truck = Truck.find_by_id(params[:id])
    erb :"trucks/show.html"
  end

  get '/trucks/:id/edit' do 
    @truck = Truck.find(params[:id])
    @truck.model = params[:model]
    @truck.make = params[:make]

    if session[:id] == @truck.user_id
      erb :"trucks/edit.html"
    else
      redirect "/trucks"
    end
  end

  patch '/trucks/:id' do
    @truck = Truck.find(params[:id])
    @truck.model = params[:model]
    @truck.make = params[:make]
    @truck.user_id = session[:id]
    @truck.save 

    redirect "/trucks/#{@truck.id}"
  end

  delete '/trucks/:id' do
    @truck = Truck.find(params[:id])
    @truck.destroy

    redirect '/trucks'
  end
end
