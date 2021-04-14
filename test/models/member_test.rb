require "test_helper"

class MemberTest < ActiveSupport::TestCase
  setup do
    @homer = Member.new(name: 'Homer', website_url: 'https://www.everlywell.com/blog/sleep-and-stress/migraines-possible-causes/')
  end

  test "valid member" do
    assert @homer.valid?
  end

  test "invalid without name" do
    @homer.name = nil
    assert_not @homer.valid?
    assert @homer.errors.added?(:name, :blank)
  end

  test "invalid without website_url" do
    @homer.website_url = nil
    assert_not @homer.valid?
    assert @homer.errors.added?(:website_url, :blank)
  end
end
