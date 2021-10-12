class StandardsController < ApplicationController
   
    before_action :set_account
    before_action :set_board
    before_action :set_board_standard, only: [:show]
  
    
    def index
      json_response(@board.standards)
    end
  
    
    def show
      if validate_token  
        puts "Showing!"  
        json_response(@standard)
        puts @standard.to_json
        
      else
        puts "Wrong Token"
      end
     
    end

    private
  
    def standard_params
      params.permit(:class_id)
    end
  
    def set_account
      @account = Account.find_by(params[:id])
    end
    def set_board
      @board = @account.boards.find_by(id: params[:account_id]) if @account
    end
  
    def set_board_standard
      @standard = @board.standards.find_by!(id: params[:board_id]) if @board
    end

    def validate_token
      @header = request.headers['Authorization']
      if @header.blank?
        puts "TOKEN IS BLANK"
      elsif Account.where(token: @header)
        puts "TRUEEEE"
        return @standard.to_json
      else 
          return false
      end
  end
  
end

