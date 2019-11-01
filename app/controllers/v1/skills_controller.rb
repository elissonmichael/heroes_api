class V1::SkillsController < ApplicationController
  before_action :set_skill, only: %i[update destroy]

  def create
    character = Character.find(params[:character_id])
    @skill = character.skills.new(skill_params)

    if @skill.save
      render :show, status: :created,
                    location: v1_character_path(@skill.character)
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  def update
    if @skill.update(skill_params)
      render :show, status: :ok, location: v1_character_path(@skill.character)
    else
      render json: @skill.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @skill.destroy
  end

  private

  def set_skill
    @skill = Skill.find(params[:id])
  end

  def skill_params
    params.require(:skill).permit(:name, :ability, :proficient)
  end
end
