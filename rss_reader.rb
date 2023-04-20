require 'rss'
require 'open-uri'

def process_args(argument)
  batch = []
    
  if valid_url?(argument) && argument.length > 1
    batch.push(argument)
  else 
    puts "valid urls not supplied"
  end

  batch.each do |url|
    parse_url(url)
  end

 
end

def valid_url?(url)
  url =~ URI::regexp
end

def parse_url(url)
  URI.open(url) do |rss|
    feed = RSS::Parser.parse(rss)
    puts "\n"
    puts "Title: #{feed.channel.title}"
    puts "Description: #{feed.channel.description}"
    puts "Link: #{feed.channel.link}"
  end

  rescue OpenURI::HTTPError 
    puts "Couldn't parse url"
end

ARGV.each { |option| process_args(option)}


