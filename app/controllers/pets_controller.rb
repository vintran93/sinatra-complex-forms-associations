class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index'
  end

  get '/pets/new' do
    erb :'/pets/new'
  end

  post '/pets' do
  # - creates a new pet and associates an existing owner
  # - creates a new pet and a new owner
    @pet = Pet.create(params[:pet])

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end

    @pet.save
    redirect to "pets/#{@pet.id}"
  end

  get '/pets/:id' do
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

  get '/pets/:id/edit' do
  # - can visit '/pets/:id/edit'
  # - loads form to edit a pet and his owner
  # - edits the pet's name
  # - edits the pet's owner with an existing owner
  # - edits the pet's owner with a new owner
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  patch '/pets/:id' do
  # - edits the pet's name
  # - edits the pets owner with an existing owner
  # - edits the pet's owner with a new owner
    @pet = Pet.find(params[:id])
    @pet.update(params[:pet])

    #binding.pry

    if !params["owner"]["name"].empty?
      @pet.owner = Owner.create(name: params["owner"]["name"])
    end

    @pet.save
    redirect to "pets/#{@pet.id}"
  end
end

#https://dev.to/neshaz/how-to-use-rake-db-commands-in-the-correct-way--50o2