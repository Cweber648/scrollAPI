# Our Lovely API
(Huge thanks to Dan K, of empañada fame, for telling us to Google the ```--api``` flag! And just for being a solid human in general!)

## Groovy. How does it work?
### Setup:
(This is only necessary if you want to play with our API locally. It's working fine and dandy on Heroku in its current form.)
* rails db:create
* rails db:migrate
* rails db:seed
    * For now we'll just seed our database with just one Scrollio object.
    * Obvz we won't call this Scrollio, because it's PooprLoopr.
* rails s

### Making a Request to Our API:
The GET route for showing an entire scroll (Herokufied and for local funtimes):
* https://desolate-oasis-97513.herokuapp.com/scrollios/1
* localhost:3000/scrollios/1

This returns a JSON object that's a collection of articles for a given Scroll. Currently we're just sending back title and body, but eventually we could add in author and source.
Here's what it'd look like if our Scroll object with an ID of 1 is requested, assuming it has two articles associated with it:
```
[
    {
        "body": [
            "(CNN)It is a global traveling troupe like no other in sport. A patchwork of nationalities, from India, Lebanon, America, on a summer pilgrimage to worship the most successful male tennis player in history.",
            "These are Roger Federer fans.",
            "But his admirers have taken their devotion to a new level of intensity at this year's Wimbledon, descending in heavyweight numbers in a quest to watch their heavenly hero perform in his Centre Court cathedral.",
            "Some are dressed in the red and white of the Swiss flag, others are sporting the \"RF\" monogram somewhere on their person -- on earrings, t-shirts, bags, caps, tattooed on body parts.",
            "Certain fans are in a permanent state of flux. Stressed, panicked, their brains whir with worry.",
            "Followers of the 18-time grand slam champion have been making this annual journey to London for over a decade and the Swiss' supporters are well-known for their unwavering commitment to their man.",
            "But this doesn't feel like previous editions of the old tournament.",
            "READ: Federer reaches Wimbledon semifinals",
            "READ: Federer - The making of a sports great",
            "READ: Inside the wonderful world of the Wimbledon Queue",
            "Waiting in the snaking Wimbledon queue, a perplexed Novak Djokovic supporter asks why every Federer fan on the planet has descended to SW19.",
            "\"But this is not all of us,\" laughs 25-year-old Myriam Khalil of Lebanon.",
            "She is still recovering from the shock of arriving at Wimbledon Park -- a recreational ground where the famed queue for on-the-day tickets starts -- at 3am only to discover a few hundred people had already beaten her to the front of the line.",
            "A chance to be part of history",
            "\"It's been crazy. Ever since we arrived, we noticed a greater amount of Roger fans everywhere.",
            "\"It's great but, at the same time, it's stressful because everyone wants to see Roger on Centre Court. This year, in particular. It's been special.\"",
            "It's no secret that Federer has always been popular. He has 7.5m followers on Twitter, nearly 15m on Facebook and last year won the ATP World Tour's Fans' favorite award for the 14th successive year, even though he had played just 28 matches.",
            ""
        ],
        "title": "Roger Federer inspires global devotion like no other at Wimbledon - CNN"
    },
    {
        "body": [
            "Wimbledon (CNN)They said he was finished -- that, without a grand slam title for almost five years, his glory days were behind him.",
            "Roger Federer clearly wasn't listening; he's played two grand slam events in 2017 and won them both.",
            "Thanks to a shrewd and shortened schedule, the 35-year-old's match win percentage this season (93.9%) doesn't just blow away his modern-day contemporaries, it even rivals his own golden standards between 2004 and 2007.",
            "There are few players more self-assured on the ATP Tour, but even Federer hadn't dared dream of this.",
            ""
        ],
        "title": "Roger Federer: Twentieth grand slam title at US Open would be 'a joke' - CNN"
    }
]
```
Here's our POST route for adding an article (Herokufied and local):
* https://desolate-oasis-97513.herokuapp.com/scrollios/1/articles url=http://www.whatever_thing_yer_using.com/yep
* localhost:3000/scrollios/1/articles url=http://www.whatever_thing_yer_using.com/yep

This instantiates an Article object in Rubyland, associates it with the scroll_id from the route, and adds it to our database. (No error handling or validations yet.)
It also sends back this JSON as a response:
```
{
    "created_at": "2017-11-12T02:25:59.401Z",
    "id": 3,
    "scrollio_id": 1,
    "updated_at": "2017-11-12T02:25:59.401Z",
    "url": "http://www.cnn.com/2017/07/17/sport/federer-wimbledon-us-open-grand-slam-twenty/index.html"
}
```

Lastly, our DELETE route is identical to our post route. Since we're using our scrolls sort of like users, when you hit the DELETE /scrollios/:id route, we just destroy all its article and article associations.
* https://desolate-oasis-97513.herokuapp.com/scrollios/1/articles
* localhost:3000/scrollios/1/articles


If you want to mess around with this stuff, type ```brew install httpie```, and then you can type either of these routes in the console, assuming you have created, migrated, seeded, and started up the rails server:
* http :3000/scrollios/1
* http POST :3000/scrollios/1/articles url=http://www.whateveryou_choose.com
* http DELETE :3000/scrollios/1/articles
* or
* http https://desolate-oasis-97513.herokuapp.com/scrollios/1
* http POST https://desolate-oasis-97513.herokuapp.com/scrollios/1/articles url=http://www.whatever.com
* http DELETE https://desolate-oasis-97513.herokuapp.com/scrollios/1/articles

