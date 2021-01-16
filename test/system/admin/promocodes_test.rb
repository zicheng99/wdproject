require "application_system_test_case"

class Admin::PromocodesTest < ApplicationSystemTestCase
  setup do
    @admin_promocode = admin_promocodes(:one)
  end

  test "visiting the index" do
    visit admin_promocodes_url
    assert_selector "h1", text: "Admin/Promocodes"
  end

  test "creating a Promocode" do
    visit admin_promocodes_url
    click_on "New Admin/Promocode"

    fill_in "End", with: @admin_promocode.end
    fill_in "Name", with: @admin_promocode.name
    fill_in "Start", with: @admin_promocode.start
    fill_in "Type", with: @admin_promocode.type
    fill_in "Value", with: @admin_promocode.value
    click_on "Create Promocode"

    assert_text "Promocode was successfully created"
    click_on "Back"
  end

  test "updating a Promocode" do
    visit admin_promocodes_url
    click_on "Edit", match: :first

    fill_in "End", with: @admin_promocode.end
    fill_in "Name", with: @admin_promocode.name
    fill_in "Start", with: @admin_promocode.start
    fill_in "Type", with: @admin_promocode.type
    fill_in "Value", with: @admin_promocode.value
    click_on "Update Promocode"

    assert_text "Promocode was successfully updated"
    click_on "Back"
  end

  test "destroying a Promocode" do
    visit admin_promocodes_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Promocode was successfully destroyed"
  end
end
