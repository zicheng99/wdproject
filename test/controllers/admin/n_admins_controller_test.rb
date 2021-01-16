require "test_helper"

class Admin::NAdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_n_admin = admin_n_admins(:one)
  end

  test "should get index" do
    get admin_n_admins_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_n_admin_url
    assert_response :success
  end

  test "should create admin_n_admin" do
    assert_difference('Admin::NAdmin.count') do
      post admin_n_admins_url, params: { admin_n_admin: { crpw: @admin_n_admin.crpw, email: @admin_n_admin.email } }
    end

    assert_redirected_to admin_n_admin_url(Admin::NAdmin.last)
  end

  test "should show admin_n_admin" do
    get admin_n_admin_url(@admin_n_admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_n_admin_url(@admin_n_admin)
    assert_response :success
  end

  test "should update admin_n_admin" do
    patch admin_n_admin_url(@admin_n_admin), params: { admin_n_admin: { crpw: @admin_n_admin.crpw, email: @admin_n_admin.email } }
    assert_redirected_to admin_n_admin_url(@admin_n_admin)
  end

  test "should destroy admin_n_admin" do
    assert_difference('Admin::NAdmin.count', -1) do
      delete admin_n_admin_url(@admin_n_admin)
    end

    assert_redirected_to admin_n_admins_url
  end
end
