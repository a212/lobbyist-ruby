require 'openssl'

module Lobbyist
  class BasicAuth
    
    def self.header(method, params, credentials)
      "Token token=\"#{credentials[:api_key]}\", signature=\"#{generate_signature(method, params, credentials)}\""
    end
    
    private
    
    def self.generate_signature(method, params, credentials)
      params['method'] = method.to_s.downcase

      sorted = params.with_indifferent_access.sort

      signature = OpenSSL::HMAC.hexdigest('sha256', credentials[:api_secret], message(sorted))

      # Remove parameters that will be generated automaticaly by Rails.
      params.delete('method')
      params.delete('id')
    
      return signature
    end

    def self.message(params)
      message = ''
      params.each_index do |x|
        message << '&' unless x == 0
        message << "#{params[x][0].to_s}=#{params[x][1]}"
      end
      puts "Client Message: #{message}"
      return CGI.escape(message)
    end
    
  end
end