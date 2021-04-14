require "test_helper"

class HeadingTest < ActiveSupport::TestCase
  setup do
    homer = Member.create!(name: 'Homer', website_url: 'https://www.everlywell.com/blog/sleep-and-stress/migraines-possible-causes/')
    @test_heading = Heading.new(member_id: homer.id, content: "test")
  end

  test "valid heading" do
    assert @test_heading.valid?
  end

  test "invalid without member_id" do
    @test_heading.member_id = nil
    assert_not @test_heading.valid?
    assert @test_heading.errors.added?(:member_id, :blank)
  end

  test 'sp_holdings association works' do
    member = @test_heading.member
    expected_url = 'https://www.everlywell.com/blog/sleep-and-stress/migraines-possible-causes/'
    assert_equal 'Homer', member.name
    assert_equal expected_url, member.website_url
  end
end
