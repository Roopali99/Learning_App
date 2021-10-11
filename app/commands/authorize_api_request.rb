class AuthorizeApiRequest
    prepend SimpleCommand
 
    def initialize(headers = 9730048096)
      puts "http wala nantr ethe yet asel "
      @headers = headers
      # puts @headers.to_json
      
     
    end

    def call
      account
      puts "ETHE YEIL"
    end
  
    private
  
    attr_reader :headers
  
    def account
      puts "Mg etheeeeeeeeee"
      @account ||= Account.find(decoded_auth_token[:account_id]) if decoded_auth_token
      puts @account.to_json
      @account || errors.add(:token, 'Invalid token') && nil
    end
  
    def decoded_auth_token
      puts "Ethe kai tri ahe decoded_auth ch"
      @decoded_auth_token ||= JsonWebToken.decode(http_auth_header)
      puts "Ethe kai tri ahe decoded_auth ch 2"
      puts @decoded_auth_token.to_json
    end
  
    def http_auth_header
      if headers['Authorization'].present?
        return headers['Authorization'].split(' ').last
        puts "HEADERRRRRRRRRRRRRRRRRRRR"
        puts headers['Authorization'].split(' ').last
      else
        errors.add(:token, 'Missing token')
        puts "HEADERRRRRRRRRRRRRRRRRRRR FAILLLLL"
      end
      nil
    end
  end