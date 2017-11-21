# Rails API for Slow Your Scroll React Native app
The React Native app that uses this API can be found here:

https://github.com/byzantinist/scroll_react_native

This was created by Matthew Black, Charlie Weber, Eric Chiang, and Michelle DiBiase as part of their final project at Dev Bootcamp. It's currently hosted on Heroku and utilizes a Postgres database.

### Making Requests to Our API:
The GET route for showing an entire scroll returns a JSON object that's a collection of articles. Here's how the JSON response is formatted:
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
The POST route for adding an article uses an iOS device's unique identifier to associate the new article with the correct scroll, which makes user registration unnecessary.


This API also provides DELETE routes for individual articles and all articles associated with a scroll.

