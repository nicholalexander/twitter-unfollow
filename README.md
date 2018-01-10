# twitter-unfollow

Forked from https://github.com/KrauseFx/twitter-unfollow.  

[I've made a lot of special modifications myself.](https://www.youtube.com/watch?v=Mrx24jofi0w)

This script works in two stages.  

**Stage 1**:  It first unfollows EVERYBODY you follow.  It saves the usernames of each person in a file called `unfollowed_usernames.txt` and it saves the full profile description for each person in a file called `unfollowed_full_names.txt`.

**Stage 2**: It goes back through the file of unfollowed people and adds each user to a twitter list, so that you can get your usual feed if you so want.

I referenced this script and wrote more about it on my [blog](http://thataboutness.com) where you should also read more about it.

Please read fine print so you don't get upset!

Don't follow me on twitter: @nicholalexander

Thanks!

## Usage

1. Create your application via [Twitter Apps](https://apps.twitter.com)
2. Set up your environment variables in the .env file so that you have something that looks like this:

```
CONSUMER_KEY='hTevf3YAcUv0mo75485CqE0qu'
CONSUMER_SECRET='iHXJUAf3g1gxcmYeEYUQLky2CySlllkeZ01Atw8yAvYp8NpEVV'
ACCESS_TOKEN='1616421-8FbWIrCayWHv5bqMAq7ZYUlOzkxbxG4Gv0fGZRiLwa'
ACCESS_TOKEN_SECRET='HPZhnBLoKNKVOBIMqWDPtCC0Nuw2ePNh9zWumiqovLXbX'
```

3. Create a new list called 'People' on twitter.  If you want to call it something different, you'll have to change line 12 in `twitter_unfollow.rb` to reflect the name of the list you created.
4. run `ruby twitter_unfollow.rb`
5. revel in social media freedom.

*nb. I've changed those keys so they won't work for you and they wouldn't work anyway, because the app you generate will only be able to modify your own profile.*

## Notes, Warnings and Caveats

Firstly, this is untested software that I made for myself, so, take that with a grain of salt.  

Secondly, I haven't tested it since refactoring it.  

Thirdly, sometimes there will be a person who you unfollowed who can not be added to a list because of permissions they set, so that person will not be anywhere except in the unfollowed list and it isn't logged anywhere, so... nota bene!  

Fourthly, people will see you unfollowing them and adding them to a list.  If you name the list "Stupid People I Used To Follow" they may become agitated.

Fifthly, if it breaks somewhere and you run it again, you might delete your text files with the stored names in it.  So, nota bene!

If you wish to improve this code, please!