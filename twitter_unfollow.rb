require 'dotenv/load'
require 'twitter'
require 'pry'

require './lib/lister'
require './lib/twitter_client'
require './lib/unfollower'



Unfollower.new.run
Lister.new("people").run