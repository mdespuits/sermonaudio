# SermonAudio gem

The SermonAudio gem enables church ruby developers who need easily access sermons and information right from SermonAudio without having to configure any SOAP clients.

  - [![Quality](http://img.shields.io/codeclimate/github/mattdbridges/sermonaudio.svg?style=flat-square)](https://codeclimate.com/github/mattdbridges/sermonaudio)
  - [![Coverage](https://img.shields.io/coveralls/mattdbridges/sermonaudio/master.svg?style=flat-square)](https://coveralls.io/r/mattdbridges/sermonaudio)
  - [![Build](http://img.shields.io/travis-ci/mattdbridges/sermonaudio.svg?style=flat-square)](https://travis-ci.org/mattdbridges/sermonaudio)
  - [![Dependencies](http://img.shields.io/gemnasium/mattdbridges/sermonaudio.svg?style=flat-square)](https://gemnasium.com/mattdbridges/sermonaudio)
  - [![Downloads](http://img.shields.io/gem/dtv/sermonaudio.svg?style=flat-square)](https://rubygems.org/gems/sermonaudio)
  - [![Tags](http://img.shields.io/github/tag/mattdbridges/sermonaudio.svg?style=flat-square)](http://github.com/mattdbridges/sermonaudio/tags)
  - [![Releases](http://img.shields.io/github/release/mattdbridges/sermonaudio.svg?style=flat-square)](http://github.com/mattdbridges/sermonaudio/releases)
  - [![Issues](http://img.shields.io/github/issues/mattdbridges/sermonaudio.svg?style=flat-square)](http://github.com/mattdbridges/sermonaudio/issues)
  - [![License](http://img.shields.io/badge/license-MIT-brightgreen.svg?style=flat-square)](http://opensource.org/licenses/MIT)
  - [![Version](http://img.shields.io/gem/v/sermonaudio.svg?style=flat-square)](https://rubygems.org/gems/sermonaudio)
  - [![Inline docs](http://inch-ci.org/github/mattdbridges/sermonaudio.png?branch=master)](http://inch-ci.org/github/mattdbridges/sermonaudio)

## Installation

To install sermonaudio, add the following line to your Gemfile:

    gem 'sermonaudio'

Then run bundle to install it:

    bundle install

## Configuration

You can configure SermonAudio in one of two ways.

* Environment variables
* Ruby

### Environment Variables

There are three environment variables SermonAudio responds to:

* `SERMONAUDIO_MEMBER_ID`
* `SERMONAUDIO_PASSWORD`
* `SERMONAUDIO_API_KEY` (Note: Not yet used. Only for JSON endpoints)

Example Usage:

```ruby
$ SERMONAUDIO_MEMBER_ID=example irb -r sermonaudio
irb(main):001:0> SermonAudio.member_id
=> "example"
irb(main):002:0> SermonAudio.password
=> nil
irb(main):003:0> ENV["SERMONAUDIO_PASSWORD"] = "password"
=> "password"
irb(main):004:0> SermonAudio.password
=> "password"
```

### Ruby

Setting the equivalent values in Ruby will be overridden by their `ENV` values

```ruby
$ irb -r sermonaudio
irb(main):001:0> SermonAudio.member_id
=> nil
irb(main):002:0> SermonAudio.password
=> nil
irb(main):003:0> SermonAudio.member_id = "example_member_id"
=> "example_member_id"
irb(main):004:0> SermonAudio.password = "password"
=> "password"
irb(main):005:0> SermonAudio.member_id
=> "example_member_id"
irb(main):006:0> SermonAudio.password
=> "password"
irb(main):003:0> ENV["SERMONAUDIO_PASSWORD"] = "password2"
=> "password2"
irb(main):006:0> SermonAudio.password
=> "password2"
```

## General Use

### `#submit_sermon`

```ruby
info = {
  'MemberID' => 'cbcelgin',
  'Password' => 'password',
  'Title' => 'Example Sermon',
  'ShortTitle' => 'Even Shorter',
  'SubTitle' => 'Series Name',
  'EventType' => 'Sunday Service',
  'DatePreached' => DateTime.new(2014, 7, 24),
  'Speaker' => 'Mitchell Jones',
  'BibleText' => '1 Peter 2:21-25',
  'Language' => 'English',
  'Keywords' => 'bible jesus gospel',
  'MoreInfoText' => 'This is more info about the sermon'
}
SermonAudio.submit_sermon(info)
# => "70812308178"
```

### `#update_sermon`

```ruby
info = {
  'MemberID' => 'cbcelgin',
  'Password' => 'password',
  'SermonID' => '12097128382'
  'Title' => 'Example Sermon',
  'ShortTitle' => 'Even Shorter',
  'SubTitle' => 'Series Name',
  'EventType' => 'Sunday Service',
  'DatePreached' => DateTime.new(2014, 7, 24),
  'Speaker' => 'Mitchell Jones',
  'BibleText' => '1 Peter 2:21-25',
  'Language' => 'English',
  'Keywords' => 'bible jesus gospel',
  'MoreInfoText' => 'This is more info about the sermon'
}
SermonAudio.update_sermon(info)
# => nil
```

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

### `#favorite_sermons`

```ruby
SermonAudio.favorite_sermons
# => [{:sermon_id=>"7101111626",
#   :title=>"This Is My Comfort",
#   :sub_title=>nil,
#   :speaker=>"Mitchell Jones",
#   :event_type=>"Sunday Service",
#   :bible_text=>nil,
#   :date=>#<DateTime: 2011-07-10T00:00:00+00:00 ((2455753j,0s,0n),+0s,2299161j)>,
#   :download_count=>"0",
#   :mp3_duration=>nil,
#   :mp3_filename=>nil}]
```

### `#favorite_speakers`

```ruby
SermonAudio.favorite_speakers
# [{:speaker_name=>"Pastor Tim Goad", :sort_name=>"Goad, Tim", :counter=>"470"},
#  {:speaker_name=>"Mitchell Jones", :sort_name=>"Jones, Mitchell", :counter=>"216"}]
```

### `#favorite_broadcasters`

```ruby
SermonAudio.favorite_broadcasters
# => [{:source_id=>"cbcelgin",
#   :source_desc=>"Cornerstone Baptist Church",
#   :source_location=>"Elgin, Texas",
#   :minister=>"Pastor Mitchell Jones"}]
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

### `#newest_sermons_by_speaker`

```ruby
SermonAudio.newest_sermons_by_speaker("Mitchell Jones")
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
