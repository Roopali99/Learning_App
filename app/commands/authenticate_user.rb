class AuthenticateUser 
    prepend SimpleCommand
  
    def initialize(mobile, otp)
      @mobile = mobile
      @otp = otp
    end
  
    def call
      JsonWebToken.encode(account_id: account.id) if account
    end
  
    private
    attr_accessor :mobile, :otp
    def account
      account = Account.find_by!(id)
      return account if account && account.authenticate(otp) 
      errors.add :account_authentication, 'invalid credentials'
      nil
    end
  end