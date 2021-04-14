require 'open-uri'
require 'nokogiri'

class PullHeadingsService
  attr_reader :document, :headings

  def initialize(url)
    @headings = []
    @content = Nokogiri::HTML(URI.open(url))
  end

  def pull_headings
    return [] if @content.nil?

    %w[h1 h2 h3].each do |heading|
      @content.css(heading).each do |element|
        @headings << element.text
      rescue StandardError
        ''
      end
    end

    @headings
  end
end
