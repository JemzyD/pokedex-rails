class PokemonsController < ApplicationController
  before_action :find_pokemon, :only => [:show, :edit, :update, :destroy]

  def index
    @pokemons = Pokemon.all
  end

  def show

  end

  def new
    @pokemon = Pokemon.new
  end

  def create
    @pokemon = Pokemon.new(pokemon_params)
    
    @pokemon.save!
    @pokemon.num = @pokemon.id.to_s.rjust(3, '0')
    if @pokemon.save
      redirect_to pokemons_path
      flash[:notice] = "Pokemon was created successfully!"
    else
      render html: 'error!'
    end
  end

  def edit

  end

  def update

    if @pokemon.update(pokemon_params)
      redirect_to pokemon_path
      flash[:notice] = "Pokemon was updated successfully!"
    else
      render html: 'error!'
    end
  end

  def destroy

    @pokemon.destroy!
    redirect_to pokemons_path
    flash[:alert] = "Pokemon was deleted successfully!"
  end


  private
  
  def pokemon_params
    params.require(:pokemon).permit(:name, :img, :height, :weight, :candy, :candy_count, :egg, :avg_spawns, :spawn_time)
  end

  def find_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end