# frozen_string_literal: true

require 'pull_headings_service'

class MemberPullHeadingsJob < ApplicationJob
  queue_as :default

  def perform(id, url)
    PullHeadingsService.new(url).pull_headings.each do |heading|
      begin
        heading.gsub!("\n", '').strip!
      rescue StandardError
        nil
      end
      Heading.create!(member_id: id, content: heading)
    end
  end
end
