require "application_system_test_case"

class ReferralsTest < ApplicationSystemTestCase
  setup do
    @referral = referrals(:one)
  end

  test "visiting the index" do
    visit referrals_url
    assert_selector "h1", text: "Referrals"
  end

  test "should create referral" do
    visit referrals_url
    click_on "New referral"

    fill_in "Email", with: @referral.email
    fill_in "Resend count", with: @referral.resend_count
    fill_in "Status", with: @referral.status
    fill_in "Token", with: @referral.token
    fill_in "User", with: @referral.user_id
    click_on "Create Referral"

    assert_text "Referral was successfully created"
    click_on "Back"
  end

  test "should update Referral" do
    visit referral_url(@referral)
    click_on "Edit this referral", match: :first

    fill_in "Email", with: @referral.email
    fill_in "Resend count", with: @referral.resend_count
    fill_in "Status", with: @referral.status
    fill_in "Token", with: @referral.token
    fill_in "User", with: @referral.user_id
    click_on "Update Referral"

    assert_text "Referral was successfully updated"
    click_on "Back"
  end

  test "should destroy Referral" do
    visit referral_url(@referral)
    click_on "Destroy this referral", match: :first

    assert_text "Referral was successfully destroyed"
  end
end
