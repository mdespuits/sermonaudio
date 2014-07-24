# SermonAudio gem

The SermonAudio gem enables church ruby developers who need easily access sermons and information right from SermonAudio without having to configure any SOAP clients.

[![Build Status](https://secure.travis-ci.org/mattdbridges/sermonaudio.png)](http://travis-ci.org/mattdbridges/sermonaudio)
[![Code Climate](https://codeclimate.com/github/mattdbridges/sermonaudio.png)](https://codeclimate.com/github/mattdbridges/sermonaudio)
[![Coverage Status](https://coveralls.io/repos/mattdbridges/sermonaudio/badge.png?branch=master)](https://coveralls.io/r/mattdbridges/sermonaudio?branch=master)
[![Inline docs](http://inch-ci.org/github/mattdbridges/sermonaudio.png?branch=master)](http://inch-ci.org/github/mattdbridges/sermonaudio)

## Installation

To install sermonaudio, add the following line to your Gemfile:

    gem 'sermonaudio'

Then run bundle to install it:

    bundle install

## General Use

### `#get_sermon_info`

```ruby
sermon_id = "720141933368"
SermonAudio.get_sermon_info(sermon_id)
# => {:sermon_id=>"720141933368",
# :title=>"Facing Death",
# :short_title=>"Facing Death",
# :sub_title=>"Psalm 23",
# :speaker=>"Mitchell Jones",
# :event_type=>"Sunday - PM",
# :bible_text=>"Psalm 23:4",
# ...
#}
```

### `#get_speakers_by_member_id`

```ruby
member_id = :cbcelgin
SermonAudio.get_speakers_by_member_id(member_id)
# => ["Kevin Bridges",
#  "Jim Bryant",
#  "Josh Bryant",
#  "Pastor Tim Goad",
#  "Mitchell Jones",
#  "Charles Wilson"]
```

### `#get_speakers_by_keyword`

```ruby
SermonAudio.get_speakers_by_keyword("Mitchell")
# => ["Mitchell Buck",
#  "Mitchell Dees",
#  "Rev. Mitchell C. Dick",
#  "Mitchell Gali",
#  "Mitchell Jones",
#  "Mitchell Mahan",
#  "Esther McMitchell",
#  "Rev. Ben Mitchell",
#  "Benjamin Mitchell",
#  "Billy Mitchell",

SermonAudio.get_speakers_by_keyword("Mitchell Jones")
# => "Mitchell Jones"
```

### `#get_series_by_member_id`

```ruby
SermonAudio.get_series_by_member_id(:cbcelgin)
# => ["1 Corinthians 13", "1 Peter", "Psalm 23", "The Beatitudes", "The Nature Of Repentance"]
```

### `#get_newest_series_by_member_id`

```ruby
SermonAudio.get_newest_series_by_member_id(:cbcelgin)
# => ["Psalm 23", "1 Peter", "1 Corinthians 13"]
```

### `#get_event_types`

```ruby
SermonAudio.get_event_types
# => ["Audio Book",
#  "Bible Study",
#  "Camp Meeting",
#  "Chapel Service",
#  "Children",
#  "Classic Audio",
#  "Conference",
#  "Current Events",
#  "Debate",
#  "Devotional",
#  "Funeral Service",
#  "Midweek Service",
#  "Podcast",
#  ....
```

### `#get_languages`

```ruby
SermonAudio.get_languages
# => ["Afrikaans",
#  "Arabic",
#  "Burundi",
#  "Catalan",
#  "Chinese",
#  "Choctaw",
#  "Czech",
#  "Danish",
#  "Dutch",
#  ....
```

### `#newest_sermons_by_member_id`

```ruby
SermonAudio.newest_sermons_by_member_id(:cbcelgin)
# => [{:sermon_id=>"720141933368",
#   :title=>"Facing Death",
#   :sub_title=>"Psalm 23",
#   :speaker=>"Mitchell Jones",
#   :event_type=>"Sunday - PM",
#   :bible_text=>"Psalm 23:4",
#   :date=>#<DateTime: 2014-07-20T18:00:00+00:00 ((2456859j,64800s,0n),+0s,2299161j)>,
#   :download_count=>"9",
#   :mp3_duration=>"39 minutes",
#   :mp3_filename=>"http://mp3.sa-media.com/filearea/720141933368/720141933368.mp3"},
#  {:sermon_id=>"720141118528",
#   :title=>"How to Trust God in Trying Times",
#   :sub_title=>nil,
#   :speaker=>"Mitchell Jones",
#   ....
```
### `#sermon_list`

```ruby
SermonAudio.sermon_list(:cbcelgin)
# => [{:sermon_id=>"720141933368",
#   :title=>"Facing Death",
#   :sub_title=>"Psalm 23",
#   :speaker=>"Mitchell Jones",
#   :event_type=>"Sunday - PM",
#   :bible_text=>"Psalm 23:4",
#   :date=>#<DateTime: 2014-07-20T18:00:00+00:00 ((2456859j,64800s,0n),+0s,2299161j)>,
#   :download_count=>"9",
#   :mp3_duration=>"39 minutes",
#   :mp3_filename=>"http://mp3.sa-media.com/filearea/720141933368/720141933368.mp3"},
#  {:sermon_id=>"720141118528",
#   :title=>"How to Trust God in Trying Times",
#   :sub_title=>nil,
#   :speaker=>"Mitchell Jones",
#   ....
```
