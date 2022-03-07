require "test_helper"

class MyPokemonsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get my_pokemons_create_url
    assert_response :success
  end

  test "should get show" do
    get my_pokemons_show_url
    assert_response :success
  end

  test "should get index" do
    get my_pokemons_index_url
    assert_response :success
  end

  test "should get search" do
    get my_pokemons_search_url
    assert_response :success
  end
end
