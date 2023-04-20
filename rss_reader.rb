require 'rss'
require 'open-uri'


# completing this as a part of code mentors
def process_args(argument)
    batch = []

    if argument =~ URI::regexp
        puts argument
        parse_url(argument)
    end
end

def parse_url(url)
    URI.open(url) do |rss|
        feed = RSS::Parser.parse(rss)
        puts "Title: #{feed.channel.title}"
        puts "Description: #{feed.channel.description}"
        puts "Link: #{feed.channel.link}"

        rescue RSS::Error

        puts "Unknown error"
    end
end

ARGV.each { |option| process_args(option)}

@options = {}


