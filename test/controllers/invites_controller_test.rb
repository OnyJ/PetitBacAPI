require 'test_helper'

class InvitesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @invite = invites(:one)
  end

  test "should get index" do
    get invites_url, as: :json
    assert_response :success
  end

  test "should create invite" do
    assert_difference('Invite.count') do
      post invites_url, params: { invite: { game_id: @invite.game_id, guest_id: @invite.guest_id } }, as: :json
    end

    assert_response 201
  end

  test "should show invite" do
    get invite_url(@invite), as: :json
    assert_response :success
  end

  test "should update invite" do
    patch invite_url(@invite), params: { invite: { game_id: @invite.game_id, guest_id: @invite.guest_id } }, as: :json
    assert_response 200
  end

  test "should destroy invite" do
    assert_difference('Invite.count', -1) do
      delete invite_url(@invite), as: :json
    end

    assert_response 204
  end
end
