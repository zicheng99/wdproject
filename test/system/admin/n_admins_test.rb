require "application_system_test_case"

class Admin::NAdminsTest < ApplicationSystemTestCase
  setup do
    @admin_n_admin = admin_n_admins(:one)
  end

  test "visiting the index" do
    visit admin_n_admins_url
    assert_selector "h1", text: "Admin/N Admins"
  end

  test "creating a N admin" do
    visit admin_n_admins_url
    click_on "New Admin/N Admin"

    fill_in "Crpw", with: @admin_n_admin.crpw
    fill_in "Email", with: @admin_n_admin.email
    click_on "Create N admin"

    assert_text "N admin was successfully created"
    click_on "Back"
  end

  test "updating a N admin" do
    visit admin_n_admins_url
    click_on "Edit", match: :first

    fill_in "Crpw", with: @admin_n_admin.crpw
    fill_in "Email", with: @admin_n_admin.email
    click_on "Update N admin"

    assert_text "N admin was successfully updated"
    click_on "Back"
  end

  test "destroying a N admin" do
    visit admin_n_admins_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "N admin was successfully destroyed"
  end
end
