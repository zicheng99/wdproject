require "application_system_test_case"

class ShoppersTest < ApplicationSystemTestCase
  setup do
    @shopper = shoppers(:one)
  end

  test "visiting the index" do
    visit shoppers_url
    assert_selector "h1", text: "Shoppers"
  end

  test "creating a Shopper" do
    visit shoppers_url
    click_on "New Shopper"

    fill_in "Address", with: @shopper.address
    fill_in "Current password", with: @shopper.current_password
    fill_in "Email", with: @shopper.email
    fill_in "Name", with: @shopper.name
    fill_in "New password", with: @shopper.new_password
    click_on "Create Shopper"

    assert_text "Shopper was successfully created"
    click_on "Back"
  end

  test "updating a Shopper" do
    visit shoppers_url
    click_on "Edit", match: :first

    fill_in "Address", with: @shopper.address
    fill_in "Current password", with: @shopper.current_password
    fill_in "Email", with: @shopper.email
    fill_in "Name", with: @shopper.name
    fill_in "New password", with: @shopper.new_password
    click_on "Update Shopper"

    assert_text "Shopper was successfully updated"
    click_on "Back"
  end

  test "destroying a Shopper" do
    visit shoppers_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Shopper was successfully destroyed"
  end
end
