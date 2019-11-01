require 'test_helper'

class ListingCharactersTest < ActionDispatch::IntegrationTest
  test 'return array of all characters' do
    get '/v1/characters'
    names = extract_names
    %w[Elisson Satya Krishynan Brandon Nyorai].each do |name|
      assert_includes names, name
    end
  end

  test 'return character by id' do
    character = characters(:elisson)
    get "/v1/characters/#{character.id}"
    assert response.success?
    character_response = json(response.body)
    assert_equal character.name, character_response[:name]
  end

  test 'return characters searched by name' do
    get '/v1/characters?character_name=kri'
    names = extract_names
    assert_includes names, 'Krishynan'
    assert_equal 1, names.size
  end

  test 'return characters filtered by dexterity greater than 10' do
    get '/v1/characters?dex_gt=10'
    names = extract_names
    refute_includes names, 'Elisson'
    assert_includes names, 'Krishynan'
    assert_equal 3, names.size
  end

  test 'return characters filtered by dexterity less than 10' do
    get '/v1/characters?dex_lt=10'
    names = extract_names
    refute_includes names, 'Krishynan'
    assert_includes names, 'Elisson'
    assert_equal 2, names.size
  end

  test 'return characters filtered by strength greater than 10' do
    get '/v1/characters?str_gt=10'
    names = extract_names
    refute_includes names, 'Elisson'
    assert_includes names, 'Brandon'
    assert_equal 2, names.size
  end

  test 'return characters filtered by strength less than 10' do
    get '/v1/characters?str_lt=10'
    names = extract_names
    refute_includes names, 'Nyorai'
    assert_includes names, 'Krishynan'
    assert_equal 3, names.size
  end

  test 'return characters filtered by charisma greater than 10' do
    get '/v1/characters?cha_gt=10'
    names = extract_names
    refute_includes names, 'Elisson'
    assert_includes names, 'Brandon'
    assert_equal 2, names.size
  end

  test 'return characters filtered by charisma less than 10' do
    get '/v1/characters?cha_lt=10'
    names = extract_names
    refute_includes names, 'Nyorai'
    assert_includes names, 'Satya'
    assert_equal 2, names.size
  end

  test 'return characters filtered by wisdom > 15 and intelligence > 15 ' do
    get '/v1/characters?wis_gt=15&int_gt=15'
    names = extract_names
    refute_includes names, 'Brandon'
    assert_includes names, 'Nyorai'
    assert_equal 1, names.size
  end

  test 'return characters filtered by wisdom < 5 and intelligence < 5 ' do
    get '/v1/characters?wis_lt=5&int_lt=5'
    names = extract_names
    refute_includes names, 'Brandon'
    assert_includes names, 'Elisson'
    assert_equal 1, names.size
  end
  private

  def extract_names
    assert response.success?
    characters = json(response.body)
    characters.map { |character| character[:name] }
  end
end
