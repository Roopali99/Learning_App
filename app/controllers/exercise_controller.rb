class ExerciseController < ApplicationController  
  before_action :set_account
  before_action :set_board
  before_action :set_board_standard
  before_action :set_standard_subject
  before_action :set_subject_lesso
  before_action :set_lesso_exercise, only: [:show]
          
  def index
    json_response(@lesso.exercises)
  end

  def show
    if validate_token    
      puts "Show!"
      # json_response(@exercise)
      puts @exercise.to_json
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
    @subject = @standard.subject.find_by!(id: params[:standard_id]) if @standard 
  end
          
  def set_subject_lesso
    @lesso = @subject.lessos.find_by!(id: params[:subject_id]) if @subject 
  end

  def set_lesso_exercise
    @exercise = @lesso.exercises.find_by!(id: params[:id]) if @lesso   
  end

  def validate_token
    @header = request.headers['Authorization']
    if @header.blank?
      puts "TOKEN IS BLANK"
    elsif Account.where(token: @header)
      puts "True!"
      return @exercise.to_json
    else 
      return false
    end
  end    
end
