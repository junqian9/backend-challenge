require "test_helper"

class FriendshipsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homer = Member.create!(name: 'Homer', website_url: 'https://www.everlywell.com/blog/sleep-and-stress/migraines-possible-causes/')
    @marge = Member.create!(name: 'Marge', website_url: 'https://www.everlywell.com/blog/sti-testing/are-any-stds-not-curable/')
  end

  test "should be able to create bi-directional friendship" do
    get new_member_friendship_path(id: @homer.id, member_id: @marge.id)

    assert_redirected_to member_path(@homer.id)
    assert_equal @marge.id, @homer.friendships.first.friend_id
    assert_equal @homer.id, @marge.friendships.first.friend_id
  end
end
