# Solar2D Embeddable ScrollView

## Overview

When you put Solar2D's widget.newScrollView inside of another widget.newScrollView, there is some funky behavior. This plugin allows you to fix that by using embeddableScrollview.create.

## Demo Video

https://www.youtube.com/watch?v=04L_njW_MjM

## Add following to your `build.settings` to use:

```lua
{
    plugins = {
        ["plugin.embeddablescrollview"] = {
            publisherId = "io.joehinkle",
        },
    },
}
```

## Use

**Import**

``lua
local embeddableScrollview = require "plugin.embeddablescrollview"
``

**Extra Options**

With an embedded scrollview you get a few extra parameters added to the built-in scrollview:

* displayObjectToGiveTouchFocusFromHorizontalScroll
* displayObjectToGiveTouchFocusFromVerticalScroll
* displayObjectToGiveTouchFocusFromFunctionCall


**Scrollview, but gives aways horizontal scrolls**

```lua
myEmbeddedScrollView = embeddableScrollview.create({
    ...
    displayObjectToGiveTouchFocusFromHorizontalScroll = parentScrollView,
    ...
})
```

**Scrollview, but gives aways vertical scrolls**

```lua
myEmbeddedScrollView = embeddableScrollview.create({
    ...
    displayObjectToGiveTouchFocusFromVerticalScroll = parentScrollView,
    ...
})
```

**Scrollview, but can manually give away**

```lua
myEmbeddedScrollView = embeddableScrollview.create({
    ...
    displayObjectToGiveTouchFocusFromFunctionCall = parentScrollView,
    ...
})
-- somewhere later in code
myEmbeddedScrollView:giveFocusAway() -- gives it to whatever was set in as displayObjectToGiveTouchFocusFromFunctionCall
```

## Links 

- Form post: https://forums.solar2d.com/t/horizontal-scrollview-inside-a-vertical-scrollview/351792/


# Shameless plugs

* <img src="https://cdnjs.cloudflare.com/ajax/libs/webicons/2.0.0/webicons/webicon-youtube-s.png" width="15"> [My YouTube channel](https://www.youtube.com/channel/UCje9o1NPdBs0vhPp7AEgWvg)
* <img src="https://cdnjs.cloudflare.com/ajax/libs/webicons/2.0.0/webicons/webicon-youtube-s.png" width="15"> [My second YouTube channel](https://www.youtube.com/channel/UC5aSLB42ZZIDtQXrZgnS1iA)
* <img src="https://www.joehinkle.io/favicon192x192.png" width="15"> [My Website](https://www.joehinkle.io/)
* <img src="https://cdnjs.cloudflare.com/ajax/libs/webicons/2.0.0/webicons/webicon-twitter-s.png" width="15"> [My Twitter](https://twitter.com/joehink95)
* <img src="https://cdnjs.cloudflare.com/ajax/libs/webicons/2.0.0/webicons/webicon-linkedin-s.png" width="15"> [My LinkedIn](https://www.linkedin.com/in/joehinkle11/)
* <img src="https://cdnjs.cloudflare.com/ajax/libs/webicons/2.0.0/webicons/webicon-android-s.png" width="15"> [My Android Apps](https://play.google.com/store/apps/dev?id=6380399300644608862)
* <img src="https://cdnjs.cloudflare.com/ajax/libs/webicons/2.0.0/webicons/webicon-apple-s.png" width="15"> [My iOS Apps](https://apps.apple.com/us/developer/joseph-hinkle/id916334630)
* 🤓 [Hire Me](https://www.joehinkle.io/services)
