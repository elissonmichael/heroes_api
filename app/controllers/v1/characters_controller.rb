class V1::CharactersController < ApplicationController
  before_action :set_character, only: %i[show update destroy]

  def index
    @characters = Character.character_name(params[:character_name])
                           .dex_lt(params[:dex_lt])
                           .dex_gt(params[:dex_gt])
                           .str_gt(params[:str_gt])
                           .str_lt(params[:str_lt])
                           .con_gt(params[:con_gt])
                           .con_lt(params[:con_lt])
                           .int_gt(params[:int_gt])
                           .int_lt(params[:int_lt])
                           .wis_gt(params[:wis_gt])
                           .wis_lt(params[:wis_lt])
                           .cha_gt(params[:cha_gt])
                           .cha_lt(params[:cha_lt])
                           .includes(:skills)
  end

  def show; end

  def create
    @character = Character.new(character_params)
    if @character.save
      render json: { character: @character },
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
