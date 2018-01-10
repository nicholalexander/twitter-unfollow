require 'dotenv/load'
require 'twitter'

class Unfollow
  def run
    begin
      @client = create_client
      raise "Please create a list called 'Old Follows'" if old_follows_list.nil?
      followings = @client.following

      followings.each do |user|
        puts "Unfollowing user #{user.screen_name} (#{user.name})"
        @client.unfollow(user.id)
        `echo "#{user.screen_name}" >> unfollowed_usernames.txt`
        `echo "#{user.screen_name} (#{user.name}): #{user.description}" >> unfollowed_full_names.txt`
        sleep 0.1
      end
    rescue => e
      if e.class == Twitter::Error::TooManyRequests
        puts "#{e} - Sleeping"
        sleep 20
        retry
      else
        raise e
      end
    end
  end

  def old_follows_list
    @_old_follows_list ||= @client.lists.find { |a| a.name == "People" }
  end

  def create_client
    client = Twitter::REST::Client.new do |config|
      config.consumer_key        = 'hTevf3YAcUv0mo75485CqE0qu'
      config.consumer_secret     = 'iHXJUAf3g1gxcmYeEYUQLky2CySlllkeZ01Atw8yAvYp8NpEVV'
      config.access_token        = '1616421-8FbWIrCayWHv5bqMAq7ZYUlOzkxbxG4Gv0fGZRiLwa'
      config.access_token_secret = 'HPZhnBLoKNKVOBIMqWDPtCC0Nuw2ePNh9zWumiqovLXbX'
    end
  end
end

Unfollow.new.run
