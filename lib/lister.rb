class Lister
  # attr_reader :client, :usernames, :list

  def initialize(list)
    @client = TwitterClient.new.client
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
        elsif e.message == "You aren't allowed to add members to this list."
          # should log it.
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

end
