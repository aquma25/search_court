require "application_system_test_case"

class PlayGroundsTest < ApplicationSystemTestCase
  setup do
    @play_ground = play_grounds(:one)
  end

  test "visiting the index" do
    visit play_grounds_url
    assert_selector "h1", text: "Play Grounds"
  end

  test "creating a Play ground" do
    visit play_grounds_url
    click_on "New Play Ground"

    fill_in "Address", with: @play_ground.address
    fill_in "Content", with: @play_ground.content
    fill_in "Court name", with: @play_ground.court_name
    fill_in "Latitude", with: @play_ground.latitude
    fill_in "Longitude", with: @play_ground.longitude
    fill_in "Place", with: @play_ground.place
    check "Release" if @play_ground.release
    fill_in "Status", with: @play_ground.status
    fill_in "User", with: @play_ground.user_id
    click_on "Create Play ground"

    assert_text "Play ground was successfully created"
    click_on "Back"
  end

  test "updating a Play ground" do
    visit play_grounds_url
    click_on "Edit", match: :first

    fill_in "Address", with: @play_ground.address
    fill_in "Content", with: @play_ground.content
    fill_in "Court name", with: @play_ground.court_name
    fill_in "Latitude", with: @play_ground.latitude
    fill_in "Longitude", with: @play_ground.longitude
    fill_in "Place", with: @play_ground.place
    check "Release" if @play_ground.release
    fill_in "Status", with: @play_ground.status
    fill_in "User", with: @play_ground.user_id
    click_on "Update Play ground"

    assert_text "Play ground was successfully updated"
    click_on "Back"
  end

  test "destroying a Play ground" do
    visit play_grounds_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Play ground was successfully destroyed"
  end
end
