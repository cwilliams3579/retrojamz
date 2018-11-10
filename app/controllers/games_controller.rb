class GamesController < ApplicationController
  before_action :set_game, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :search, :show]


  def search
    if params[:search].present?
      @games = Game.search(params[:search])
    else
      @games = Game.all
    end
  end

  def index
    @games = Game.all
    @game = Game.new
  end

  # GET /games/1
  # GET /games/1.json
  def show
    # respond_to do |format|
    #   format.js {render layout: false} # Add this line to you respond_to block
    # end
  end

  # GET /games/new
  def new
    @game = current_user.games.build
  end

  # GET /games/1/edit
  def edit
  end

  # POST /games
  # POST /games.json
  def create
    # @game = Game.new(game_params)
    @game = current_user.games.new(params[:game_params])
    respond_to do |format|
      if @game.save
        format.js
        format.html { redirect_to @game, notice: 'Game was successfully created.' }
        format.json { render :show, status: :created, location: @game }
      else
        format.html { render :new }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end


  def update
    respond_to do |format|
      if @game.update(game_params)
        format.html { redirect_to @game, notice: 'Game was successfully updated.' }
        format.json { render :show, status: :ok, location: @game }
      else
        format.html { render :edit }
        format.json { render json: @game.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @game.destroy
    respond_to do |format|
      format.html { redirect_to games_url, notice: 'Game was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_game
      @game = Game.find(params[:id])
    end

    def game_params
      params.require(:game).permit(:platform, :company, :genre, :title, :image, :content, :user_id, :release_date)
    end
end
