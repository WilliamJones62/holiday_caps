require 'test_helper'

class TurkeyCapsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @turkey_cap = turkey_caps(:one)
  end

  test "should get index" do
    get turkey_caps_url
    assert_response :success
  end

  test "should get new" do
    get new_turkey_cap_url
    assert_response :success
  end

  test "should create turkey_cap" do
    assert_difference('TurkeyCap.count') do
      post turkey_caps_url, params: { turkey_cap: { channel: @turkey_cap.channel, dc: @turkey_cap.dc, part: @turkey_cap.part, units: @turkey_cap.units } }
    end

    assert_redirected_to turkey_cap_url(TurkeyCap.last)
  end

  test "should show turkey_cap" do
    get turkey_cap_url(@turkey_cap)
    assert_response :success
  end

  test "should get edit" do
    get edit_turkey_cap_url(@turkey_cap)
    assert_response :success
  end

  test "should update turkey_cap" do
    patch turkey_cap_url(@turkey_cap), params: { turkey_cap: { channel: @turkey_cap.channel, dc: @turkey_cap.dc, part: @turkey_cap.part, units: @turkey_cap.units } }
    assert_redirected_to turkey_cap_url(@turkey_cap)
  end

  test "should destroy turkey_cap" do
    assert_difference('TurkeyCap.count', -1) do
      delete turkey_cap_url(@turkey_cap)
    end

    assert_redirected_to turkey_caps_url
  end
end
