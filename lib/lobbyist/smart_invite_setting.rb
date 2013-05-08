module Lobbyist
  class SmartInviteSetting < Lobbyist::Base

    attr_accessor :id, :company_id, :enabled, :google_long_url, :google_short_url,
      :yahoo_long_url, :yahoo_short_url, :yelp_long_url, :yelp_short_url, :created_at, :updated_at

  end
end