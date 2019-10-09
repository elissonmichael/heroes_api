class V1::CharactersController < ApplicationController
  before_action :set_character, only: [:show, :update, :destroy]

  def index
    @characters = Character.all
  end

  def show; end

  def create
    @character = Character.new(character_params)
    if @character.save
      render json: { character: @character},
                     status: 201, location: v1_character_path(@character)
    else
      render json: { errors: @character.errors }, status: 422
    end
  end

  def update
    if @character.update(character_params)
      render json: { character: @character }
    else
      render json: { errors: @character.errors }, status: 422
    end
  end

  def destroy
    @character.destroy
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character)
          .permit(:name, :strength, :constitution, :dexterity, :intelligence,
                  :wisdom, :charisma)
  end
end
