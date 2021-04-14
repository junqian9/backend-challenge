require 'short_url_service'

class MemberShortUrlJob < ApplicationJob
  queue_as :default

  def perform(id, url)
    member = Member.find(id)
    member.short_url = ShortUrlService.shorten(url)['link']
    member.save
  end
end
