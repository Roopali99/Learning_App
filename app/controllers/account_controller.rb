class AccountController < ApplicationController
    before_action :set_account, only: [:update]

    def index
        render json: (@accounts = Account.all) 
    end
      
    def create
        @account = Account.create!(account_params)
        json_response(@account, :created)
    end

    def show
        if login 
           puts @account.token
            if validate_token    
                puts @account.to_json
                # json_response(@account)
                puts "SHOOOOOWWWWWWW"
            else
                puts "Wrong Token"
            end
        else
            puts "invalid otp"
        end
    end    
    def update
        @account.update(account_params)
        head :no_content
    end      
    private
      
    def account_params
        params.permit(:student_name, :email, :mobile, :dob, :otp)
    end

    def set_account
       @account = Account.find_by!(params[:id]) 
    end

    def login 
        @account = Account.find_by(params[:id]) 
        access_token = Doorkeeper::AccessToken.create(
            puts "start TOKEN PROCESS",
            resource_owner_id: @account.id,
            expires_in: Doorkeeper.configuration.access_token_expires_in.to_i,
            scopes: 'account'
        )
        token = {
            access_token: access_token.token,
            token_type: 'bearer',
            expires_in: access_token.expires_in,
            created_at: access_token.created_at
        } 
        @account.token = token 
        # puts "ACCESS TOKEN CREATED"
        # puts @account.token
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
