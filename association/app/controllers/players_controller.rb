class PlayersController < ApplicationController
  def index
  	@players = Player.all
  end

  def new
    @player = Player.new
  end

  def create
    player = Player.new(player_params)
    #player.first_name = params[:player][:first_name]
    #player.last_name = params[:player][:last_name]
    if player.save
      #redirect_to "/players"
      redirect_to :root
    else
      flash[:errors] = player.errors.full_messages
      #redirect_to "/players/new"
      redirect_to :back
    end
  end

  def show
    @player = Player.find(params[:id])
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    player = Player.find(params[:id])
    if player.update(player_params)
      #redirect_to "/players"
      redirect_to :root
    else
      flash[:errors] = player.errors.full_messages
      #redirect_to "/players/#{player.id}/edit"
      redirect_to :back
    end
  end

  def destroy
    player = Player.find(params[:id])
    player.destroy
    #redirect_to "/players"
    redirect_to :root
  end





  private

  def player_params
    params.require(:player).permit(:first_name, :last_name)
  end


end
