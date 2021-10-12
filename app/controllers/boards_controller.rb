class BoardsController < ApplicationController

    before_action :set_account
    before_action :set_board, only: [:show, :update, :destroy]

    def index
      render json: @account.boards
    end

    def show
      if validate_token  
        puts "Showing!" 
        puts @board.to_json
        json_response(@board)
      else
        puts "Wrong token"
      end
    end

    def update
      @board.update(board_params)
      head :no_content
    end
  
    
    def destroy
      @board.destroy
      head :no_content
    end
  
    private
  
    def board_params
      params.permit(:board_nm, :board_description, :board_logo)
    end
    def set_account
      @account = Account.find_by!(params[:id])
    end
    def set_board
      @board = @account.boards.find_by(id: params[:account_id]) if @account
    end

    def validate_token
      @header = request.headers['Authorization']
      if @header.blank?
        puts "TOKEN IS BLANK"
      elsif Account.where(token: @header)
        puts "True"
        return @board.to_json
      else 
        return false
      end
  end
  
end
