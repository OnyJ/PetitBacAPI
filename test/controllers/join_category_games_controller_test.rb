require 'test_helper'

class JoinCategoryGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @join_category_game = join_category_games(:one)
  end

  test "should get index" do
    get join_category_games_url, as: :json
    assert_response :success
  end

  test "should create join_category_game" do
    assert_difference('JoinCategoryGame.count') do
      post join_category_games_url, params: { join_category_game: { category_id: @join_category_game.category_id, game_id: @join_category_game.game_id } }, as: :json
    end

    assert_response 201
  end

  test "should show join_category_game" do
    get join_category_game_url(@join_category_game), as: :json
    assert_response :success
  end

  test "should update join_category_game" do
    patch join_category_game_url(@join_category_game), params: { join_category_game: { category_id: @join_category_game.category_id, game_id: @join_category_game.game_id } }, as: :json
    assert_response 200
  end

  test "should destroy join_category_game" do
    assert_difference('JoinCategoryGame.count', -1) do
      delete join_category_game_url(@join_category_game), as: :json
    end

    assert_response 204
  end
end
