require "test_helper"

class MembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @homer = Member.create!(name: 'Homer', website_url: 'https://www.everlywell.com/blog/sleep-and-stress/migraines-possible-causes/')
    @test_heading = Heading.create!(member_id: @homer.id, content: "test")
  end

  test 'should be able to visit member index' do
    get members_url
    assert_response :success
  end

  test 'should be able to create member' do
    assert_difference 'Member.count' do
      post members_path, params: {
        member: {
          name: 'Bart',
          website_url: 'abc.com/efg'
        }
      }
    end
  end

  test 'should be able to visit member show' do
    get member_path(@homer.id)

    assert_response :success
    assert_select "h1", text: 'Homer'
  end
end
