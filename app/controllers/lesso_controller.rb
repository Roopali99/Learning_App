class LessoController < ApplicationController
    before_action :set_account
    before_action :set_board
    before_action :set_board_standard
    before_action :set_standard_subject
    before_action :set_subject_lesso, only: [:show]
    
    def index
      puts "INDEXXX"
      render json: @subject.lessos, each_serializer: LessoSerializer, root: "lesso"
    end
    
    def show
      render json: @lesso, each_serializer: LessoSerializer, root: "lesso"
      if validate_token    
       
        puts @lesso.to_json
        puts "SHOOOOOWWWWWWW"
    else
        puts "Wrong Token"
    end
      
    end
    
    def set_account
      @account = Account.find_by(params[:id])
    end
    def set_board
      @board = @account.boards.find_by(id: params[:board_id]) if @account
    end
  
    def set_board_standard
      @standard = @board.standards.find_by!(id: params[:board_id]) if @board
     # puts @standard.to_json
    end 
    
    def set_standard_subject
      @subject = @standard.subject.find_by!(id: params[:standard_id]) if @standard 
     # puts @subject.to_json
    end
  
    def set_subject_lesso
      @lesso = @subject.lessos.find_by!(id: params[:subject_id]) if @subject    
     
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
