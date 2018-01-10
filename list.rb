require 'twitter'
require 'pry'


class List
  attr_reader :client, :usernames, :list

  def initialize(list)
    @client = create_client
    @usernames = []
    @list = get_list(list)
    raise if @list.nil?
  end

  def run
    get_usernames    
    @usernames.each do |user_name|
      begin
        user = @client.user("#{user_name}")
        add(user)
        log(user)
        puts user.screen_name
      rescue => e
        if e.class == Twitter::Error::TooManyRequests
          puts "#{e} - Sleeping"
          sleep 20
          retry
        end
        if e.message == "You aren't allowed to add members to this list."
          next
        end
      end
    end
  end

  def log(user)
    `echo "#{user.screen_name}" >> listed.txt`
  end

  def add(user)
    @client.add_list_member(@list, user.id)
  end

  def get_usernames
    file = File.open("./unfollowed_usernames.txt")
    file.each_line do |line|
      @usernames << line.chomp
    end
  end

  def get_list(list)
    @client.lists.find { |a| a.name == list }
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

list = List.new("people")
list.run


  