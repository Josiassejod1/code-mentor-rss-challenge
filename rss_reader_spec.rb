require 'rss'
require 'open-uri'
require_relative 'rss_reader'

describe '#valid_url?' do
  it 'returns 0 for a valid URL' do
    url = 'https://www.example.com/rss'
    expect(valid_url?(url)).to eq(0)
  end

  it 'returns nil for an invalid URL' do
    url = 'not a valid url'
    expect(valid_url?(url)).to eq(nil)
  end
end

describe '#parse_url' do
  it 'outputs feed information for a valid URL' do
    url = 'https://www.ruby-lang.org/en/feeds/news.rss'
    expect { parse_url(url) }.to output(/Title: .+\nDescription: .+\nLink: .+/).to_stdout
  end
end

describe '#process_args' do
  it 'calls parse_url for a valid URL argument' do
    url = 'https://www.ruby-lang.org/en/feeds/news.rss'
    expect { process_args(url) }.to output(/Title: .+\nDescription: .+\nLink: .+/).to_stdout
  end

  it 'does not call parse_url for an invalid URL argument' do
    url = 'not a valid url'
    expect { process_args(url) }.to output("valid urls not supplied\n").to_stdout
  end

  it 'calls parse_url for multiple valid URL arguments' do
    urls = ['https://www.ruby-lang.org/en/feeds/news.rss', 'https://www.ruby-lang.org/en/feeds/news.rss']
    urls.each { |url| expect { process_args(url) }.to output(/Title: .+\nDescription: .+\nLink: .+/).to_stdout}
  end
end
