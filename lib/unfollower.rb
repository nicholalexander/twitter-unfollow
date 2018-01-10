class Unfollower
  def run
    begin
      @client = TwitterClient.new.client
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
end


