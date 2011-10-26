# Sermonaudio gem

The SermonAudio gem enables church ruby developers who need easily access sermons and information right from SermonAudio without having to configure any SOAP clients.

## Installation

To install sermonaudio, add the following line to your Gemfile:

    gem 'sermonaudio'

Then run bundle to install it:

    bundle install
    
## General Use

sermonaudio is very simple to use. Only two 'getter' methods are set: find and get. Here are some examples:

    sermonaudio = Sermonaudio::Savon.new
    sermonaudio.find :speakers, keyword: "sermon keywords"
    sermonaudio.find :newest, speaker_name: "Walter Chantry"
    sermonaudio.find :series, member_id: "108111234595"

    sermonaudio.get :sermons, sermon_id: "108111234595"
    sermonaudio.get :sermons, category: "category search"

Both methods are very similar, but there is a very important difference. 'find' queries do not require a member id and password

In your application configuration files, you can add this to provide your member id and password to be able to query for your sermon information.

    Sermonaudio::Configuration.build do |config|
      config.member_id = "108111234595"
      config.password = "your-password"
    end