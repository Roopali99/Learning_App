class SubjectsController < ApplicationController 

  before_action :set_account
  before_action :set_board
  before_action :set_board_standard
  before_action :set_standard_subject, only: [:show]
  
  # GET /standards/:standard_id/subjects
  def index
    json_response(@standard.subject)
  end
  
  # GET /standards/:standard_id/subjects/:id
  def show
    if validate_token    
      puts @subject.to_json
      # json_response(@account)
      puts "SHOOOOOWWWWWWW"
  else
      puts "Wrong Token"
  end
    
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
  
  def set_standard_subject
    @subject = @standard.subject.find_by!(id: params[:standard_ id]) if @standard 
  end

  def validate_token
    @header = request.headers['Authorization']
    puts "token yayala hava headrt madhe "
    puts @header.to_json
    puts "DECODE KARTA HEADER MADHE AHE KA"
    
    if @header.blank?
      puts "TOKEN IS BLANK"
    elsif Account.where(token: @header)
      return @account.to_json
    else 
        return false
    end
  end
end
