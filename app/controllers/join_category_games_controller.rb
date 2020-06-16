class JoinCategoryGamesController < ApplicationController
  before_action :set_join_category_game, only: [:show, :update, :destroy]

  # GET /join_category_games
  def index
    @join_category_games = JoinCategoryGame.all

    render json: @join_category_games
  end

  # GET /join_category_games/1
  def show
    render json: @join_category_game
  end

  # POST /join_category_games
  def create
    @join_category_game = JoinCategoryGame.new(join_category_game_params)

    if @join_category_game.save
      render json: @join_category_game, status: :created, location: @join_category_game
    else
      render json: @join_category_game.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /join_category_games/1
  def update
    if @join_category_game.update(join_category_game_params)
      render json: @join_category_game
    else
      render json: @join_category_game.errors, status: :unprocessable_entity
    end
  end

  # DELETE /join_category_games/1
  def destroy
    @join_category_game.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_join_category_game
      @join_category_game = JoinCategoryGame.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def join_category_game_params
      params.require(:join_category_game).permit(:category_id, :game_id)
    end
end
