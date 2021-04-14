# generate short URL with the bitly API
class ShortUrlService
  BITLY_SHORTEN_LINK = 'https://api-ssl.bitly.com/v4/shorten'.freeze
  BITLY_HEADERS = {
    'Content-Type' => 'application/json',
    'Authorization' => 'Bearer 5110ef7f568b05c80c8ff575b332c780c8229cb0'
    # this is the only place that needs a ENV, so I choose not to use .env so that
    # ppl can just start the app without it
  }.freeze

  def self.shorten(url)
    response = HTTParty.post(BITLY_SHORTEN_LINK, headers: BITLY_HEADERS, body: { long_url: url }.to_json)
    if [200, 201].include?(response.code)
      JSON.parse response.body
    else
      ''
    end
  end
end
