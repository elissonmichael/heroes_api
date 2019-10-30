require 'test_helper'

class SkillsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @skill = skills(:athletics)
  end

  test "should create skill" do
    assert_difference('Skill.count') do
      post v1_character_skills_url(@skill.character), params: {
        skill: {
          ability:   @skill.ability,
          name:      @skill.name
        }
      }, as: :json
    end

    assert_response 201
  end

  test "should update skill" do
    patch v1_character_skill_url(@skill.character, @skill), params: {
      skill: {
        ability:   @skill.ability,
        name:      @skill.name
      }
    }, as: :json
    assert_response 200
  end

  test "should destroy skill" do
    assert_difference('Skill.count', -1) do
      delete v1_character_skill_url(@skill.character, @skill), as: :json
    end

    assert_response 204
  end
end
