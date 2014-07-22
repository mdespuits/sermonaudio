# SermonAudio gem

The SermonAudio gem enables church ruby developers who need easily access sermons and information right from SermonAudio without having to configure any SOAP clients.

[![Build Status](https://secure.travis-ci.org/mattdbridges/sermonaudio.png)](http://travis-ci.org/mattdbridges/sermonaudio)
[![Code Climate](https://codeclimate.com/github/mattdbridges/sermonaudio.png)](https://codeclimate.com/github/mattdbridges/sermonaudio)
[![Coverage Status](https://coveralls.io/repos/mattdbridges/sermonaudio/badge.png?branch=master)](https://coveralls.io/r/mattdbridges/sermonaudio?branch=master)

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

### `#get_series_by_member_id`

```ruby
SermonAudio.get_series_by_member_id(:cbcelgin)
# => ["1 Corinthians 13", "1 Peter", "Psalm 23", "The Beatitudes", "The Nature Of Repentance"]
```

sermonaudio is very simple to use. Only two 'getter' methods are set: find and get. Here are some examples:

    sermonaudio = SermonAudio::Sermon.new
    sermonaudio.find :speakers, keyword: "sermon keywords"
    sermonaudio.find :newest, speaker_name: "Walter Chantry"
    sermonaudio.find :series, member_id: "108111234595"

    sermonaudio.get :sermons, sermon_id: "108111234595"
    sermonaudio.get :sermons, category: "category search"

Both methods are very similar, but there is a very important difference. 'find' queries do not require a member id and password

In your application configuration files, you can add this to provide your member id and password to be able to query for your sermon information.

    SermonAudio::Configuration.build do |config|
      config.member_id = "108111234595"
      config.password = "your-password"
    end
