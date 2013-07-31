# Libraries
require 'faraday'
require 'multi_json'
require 'active_support/all'

# Errors
require 'lobbyist/error/error'
require 'lobbyist/error/client_error'
require 'lobbyist/error/server_error'
require 'lobbyist/error/bad_gateway'
require 'lobbyist/error/bad_request'
require 'lobbyist/error/decode_error'
require 'lobbyist/error/forbidden'
require 'lobbyist/error/gateway_timeout'
require 'lobbyist/error/internal_server_error'
require 'lobbyist/error/not_acceptable'
require 'lobbyist/error/not_found'
require 'lobbyist/error/precondition_failed'
require 'lobbyist/error/service_unavailable'
require 'lobbyist/error/unauthorized'
require 'lobbyist/error/unprocessable_entity'

# Library
require 'lobbyist/base'
require 'lobbyist/account_level'
require 'lobbyist/appointment'
require 'lobbyist/basic_auth'
require 'lobbyist/category'
require 'lobbyist/challenge_communication'
require 'lobbyist/company_setting'
require 'lobbyist/company_user'
require 'lobbyist/company'
require 'lobbyist/contact'
require 'lobbyist/contact_draft'
require 'lobbyist/customer_call'
require 'lobbyist/draft'
require 'lobbyist/email_invitation'
require 'lobbyist/email_key'
require 'lobbyist/member_call'
require 'lobbyist/promo'
require 'lobbyist/review_challenge'
require 'lobbyist/review_comment'
require 'lobbyist/review_flag'
require 'lobbyist/review_suggestion'
require 'lobbyist/review_topic'
require 'lobbyist/review_withdrawal_request'
require 'lobbyist/review'
require 'lobbyist/reviews_count'
require 'lobbyist/smart_invite_setting'
require 'lobbyist/social_network_profile'
require 'lobbyist/suggestion_topic'
require 'lobbyist/termination_notice'
require 'lobbyist/topic'
require 'lobbyist/version'



module Lobbyist
  
#  @@api_base = 'https://api.customerlobby.com'
  @@api_base = 'http://localhost:3000'
  @@api_key = nil
  @@api_secret = nil
  
  def self.api_base
    @@api_base
  end

  def self.api_base=(base)
    @@api_base = base
  end
  
  def self.api_key
    @@api_key ||= ENV['LOBBYIST_API_KEY']
  end
  
  def self.api_key=(key)
    @@api_key = key
  end
  
  def self.api_secret
    @@api_secret ||= ENV['LOBBYIST_API_SECRET']
  end
  
  def self.api_secret=(secret)
    @@api_secret = secret
  end
  
  def self.http
    @@connection ||= Faraday.new(:url => @@api_base) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
    end
  end
end