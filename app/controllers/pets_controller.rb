class PetsController < ApplicationController

  get '/' do
    "Hello World"
  end

  get '/pets' do
    @pets = Pet.all
    erb :'pets/index'
  end

  get '/pets/new' do
    @owners = Owner.all
    erb :'/pets/new'
  end

  post '/pets' do
    #raise params.inspect
    @pet = Pet.new(name: params[:pet][:name])

    if params[:pet][:owner_id]
      @pet.owner = Owner.find(params[:pet][:owner_id])
    else
      @pet.create_owner(name: params[:owner][:name])
    end

    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
    @owners = Owner.all
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
    @pet = Pet.find(params[:id])
    owner = Owner.find(params[:pet][:owner_id])
    @pet.update(name: params[:pet][:name], owner: owner)
    redirect to "/pets/#{@pet.id}"
  end
end
