class VideoController < ApplicationController
    before_action :set_board
    before_action :set_board_standard
    before_action :set_standard_subject
    before_action :set_subject_lesso
    before_action :set_lesso_video, only: [:show]
    
    def index
     puts "Video index"
     json_response(@lesso.videos)
     puts @lesso.videos.to_json 

    end

    def show
      json_response(@video)
    end
        
    def set_board
      @board = Board.find(params[:board_id])
    end
      
    def set_board_standard
      @standard = @board.standards.find_by!(id: params[:board_id]) if @board
          
    end 
        
    def set_standard_subject
      @subject = @standard.subject.find_by!(id: params[:standard_id]) if @standard 
    end
      
    def set_subject_lesso
      @lesso = @subject.lessos.find_by!(id: params[:subject_id]) if @subject 
      puts @lesso.to_json
    end 

    def set_lesso_video
      # puts "lesso video"
      @video = @lesso.videos.find_by!(id: params[:id]) if @lesso 
      # puts @video.to_json
    end    
end
