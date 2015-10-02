class GamesController < ActionController::API
  # before_action :set_game, only: [:check]

  def create
    @game = Game.create(difficulty: params[:difficulty], state: "new")

    render json: @game, status: :created
  end

  def check
    # why doesn't "where" work???
    # @game = Game.where("id = ?", "#{params[:id]}")
    @game = Game.find(params[:id])
    @game.check(params[:row].to_i, params[:col].to_i)
    @game.save
    # what is the diff between update and save???
    # @game.update(board: @game.board)

    render json: @game
  end

  def show
    @game = Game.find(params[:id])

    render json: @game
  end

  def flag
    @game = Game.find(params[:id])
    @game.flag(params[:row].to_i, params[:col].to_i)
    @game.save

    render json: @game
  end

  # def set_game
  # end
end
