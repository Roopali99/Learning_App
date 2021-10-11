class AnalyticController < ApplicationController
    before_action :set_account
    before_action :set_board
    before_action :set_board_standard
    before_action :set_standard_subject
    before_action :set_subject_lesso
    before_action :set_content_exercise
    before_action :set_exercise_analytic, only: [:update,:destroy]
        
    def index
        json_response(@exercise.analytic)
    end
      
    def show
        if validate_token    
            puts @analytic.to_json
            # json_response(@student_solution)
            puts "SHOOOOOWWWWWWW"
        else
            puts "Wrong Token"
        end
    end
          
        # def update
        #   @student_solution.update(student_solution_params)
        #   head :no_content
        # end
        private
        
    def analytic_params
        params.permit(:ques_status, :option_selected, :status,:marked_later,:skip,:time_taken)
    end
      
    def set_account
        @account = Account.find_by(params[:id])    
    end
      
    def set_board
      @board = @account.boards.find_by(id: params[:board_id]) if @account
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
          
    def set_content_exercise
        @exercise = @lesso.exercises.find_by!(id: params[:lesso_id]) if @lesso
    end
      
    def set_exercise_analytic
        @analytic = @exercise.analytic.find_by!(id: params[:exercise_id]) if @exercise 
    end 
    
    def validate_token
        @header = request.headers['Authorization']
        puts "token yayala hava headrt madhe "
        puts @header.to_json
        puts "DECODE KARTA HEADER MADHE AHE KA"  
      
        if @header.blank?
            puts "TOKEN IS BLANK"
        elsif Account.where(token: @header)
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
