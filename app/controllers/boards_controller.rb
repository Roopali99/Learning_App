class BoardsController < ApplicationController
    # app/controllers/boards_controller.rb
    before_action :set_account
    before_action :set_board, only: [ :update, :destroy]
    # GET /boards
    def index
      # @boards = Board.all
      render json: @account.boards
    end
  
    # POST /boards
    # def create
    #   @board = Board.create!(board_params)
    #   json_response(@board, :created)
    # end

    def show
      if validate_token    
        puts @account.to_json
        # json_response(@account)
        puts "SHOOOOOWWWWWWW"
    else
        puts "Wrong Token"
    end
     
    end
  
    # PUT /boards/:id
    def update
      @board.update(board_params)
      head :no_content
    end
  
    # DELETE /boards/:id
    def destroy
      @board.destroy
      head :no_content
    end
  
    private
  
    def board_params
      params.permit(:board_nm, :board_description, :board_logo)
    end
    def set_account
      @account = Account.find_by(params[:id])
    end
    def set_board
      @board = @account.boards.find_by(id: params[:id]) if @account
    end

    def validate_token
      @header = request.headers['Authorization']
      puts "token yayala hava headrt madhe "
      puts @header.to_json
      puts "DECODE KARTA HEADER MADHE AHE KA"
      if @header.blank?
        puts "TOKEN IS BLANK"
      elsif Account.where(token: @header)
        Account.where(token: @header)
        puts "WHERE STATEMENT"
        puts  @account.to_json
        puts "TRUEEEE"
        return @account.to_json
      else 
        return false
      end
  end
  
end
