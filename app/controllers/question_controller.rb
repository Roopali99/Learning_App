class QuestionController < ApplicationController
  before_action :set_account
  before_action :set_board
  before_action :set_board_standard
  before_action :set_standard_subject
  before_action :set_subject_lesso
  before_action :set_lesso_exercise
  before_action :set_exercise_question, only: [:show]
          
  def index
    json_response(@exercise.question)
  end
     
  def show
    if validate_token    
     # puts @account.to_json
      # json_response(@question)
      puts @question.to_json
      puts "SHOOOOOWWWWWWW"
    else
      puts "Wrong Token"
    end    
  end
          
  def set_account
    @account = Account.find(params[:id])
  end

  def set_board
    @board = @account.boards.find_by!(id: params[:account_id]) if @account
  end
        
  def set_board_standard
    @standard = @board.standards.find_by!(id: params[:id]) if @board      
  end
          
  def set_standard_subject
    @subject = @standard.subject.find_by!(id: params[:id]) if @standard          
  end
          
  def set_subject_lesso
    @lesso = @subject.lessos.find_by!(id: params[:id]) if @subject          
  end
         
  def set_lesso_exercise
    @exercise = @lesso.exercises.find_by!(id: params[:id]) if @lesso           
  end
  def set_exercise_question
    @question = @exercise.question.find_by!(id: params[:id]) if @exercise 
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
