class StandardsController < ApplicationController
   
    before_action :set_account
    before_action :set_board
    before_action :set_board_standard, only: [:show]
  
    
    def index
      json_response(@board.standards)
    end
  
    
    def show
      if validate_token    
        json_response(@standard)
        puts @standard.to_json
        puts "SHOOOOOWWWWWWW"
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
      @standard = @board.standards.find_by!(id: params[:id]) if @board
    end

    def validate_token
      @header = request.headers['Authorization']
      puts "token yayala hava headrt madhe "
      puts @header.to_json
      puts "DECODE KARTA HEADER MADHE AHE KA"
      
      if @header.blank?
          puts "TOKEN IS BLANK"
      elsif Account.where(token: @header)
          # puts valid_t.to_json
          puts Account.where(token: @header)
          puts "WHERE STATEMENT"
         puts  @account.to_json
          puts "TRUEEEE"
          return @account.to_json
      else 
          return false
      end
  end
  
end

