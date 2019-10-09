require 'test_helper'

class CharactersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @character = characters(:elisson)
  end

  test "should get index" do
    get v1_characters_url, as: :json
    assert_response :success
  end

  test "should create character" do
    assert_difference('Character.count') do
      post v1_characters_url,
           params: {
             character: {
               name: @character.name,
               strength: @character.strength,
               constitution: @character.constitution,
               dexterity: @character.dexterity,
               intelligence: @character.intelligence,
               wisdom: @character.wisdom,
               charisma: @character.charisma
             }
           }, as: :json
    end

    assert_response 201
  end

  test "should show character" do
    get v1_character_url(@character), as: :json
    assert_response :success
  end

  test "should update character" do
    patch v1_character_url(@character),
      params: {
        character: {
          name: @character.name,
          strength: @character.strength,
          constitution: @character.constitution,
          dexterity: @character.dexterity,
          intelligence: @character.intelligence,
          wisdom: @character.wisdom,
          charisma: @character.charisma
        }
      }, as: :json
    assert_response 200
  end

  test "should destroy character" do
    assert_difference('Character.count', -1) do
      delete v1_character_url(@character), as: :json
    end

    assert_response 204
  end
end
