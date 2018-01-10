# twitter-unfollow

Forked from https://github.com/KrauseFx/twitter-unfollow.  

[I've made a lot of special modifications myself.](https://www.youtube.com/watch?v=Mrx24jofi0w)

This script works in two stages.  

_Stage 1_:  It first unfollows EVERYBODY you follow.  It saves the usernames of each person in a file called `unfollowed_usernames.txt` and it saves the full profile description for each person in a file called `unfollowed_full_names.txt`.

_Stage 2_: It goes back through the file of unfollowed people and adds each user to a twitter list, so that you can get your usual feed if you so want.

## Usage

1. Create your application via [Twitter Apps](https://apps.twitter.com)
2. Set up your environment variables in the .env file so that you have something that looks like this:

```
CONSUMER_KEY='hTevf3YAcUv0mo75485CqE0qu'
CONSUMER_SECRET='iHXJUAf3g1gxcmYeEYUQLky2CySlllkeZ01Atw8yAvYp8NpEVV'
ACCESS_TOKEN='1616421-8FbWIrCayWHv5bqMAq7ZYUlOzkxbxG4Gv0fGZRiLwa'
ACCESS_TOKEN_SECRET='HPZhnBLoKNKVOBIMqWDPtCC0Nuw2ePNh9zWumiqovLXbX'
```

*nb. I've changed those keys so they won't work for you and they wouldn't work anyway, because the app you generate will only be able to modify your own profile.*

3. Create a new list called 'People' on twitter.  If you want to call it something different, you'll have to change line 12 in `twitter_unfollow.rb` to reflect the name of the list you created.
4. run `ruby twitter_unfollow.rb`
5. revel in social media freedom.

## Notes, Warnings and Caveats

