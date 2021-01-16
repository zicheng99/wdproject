require "test_helper"

class Admin::PromocodesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin_promocode = admin_promocodes(:one)
  end

  test "should get index" do
    get admin_promocodes_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_promocode_url
    assert_response :success
  end

  test "should create admin_promocode" do
    assert_difference('Admin::Promocode.count') do
      post admin_promocodes_url, params: { admin_promocode: { end: @admin_promocode.end, name: @admin_promocode.name, start: @admin_promocode.start, type: @admin_promocode.type, value: @admin_promocode.value } }
    end

    assert_redirected_to admin_promocode_url(Admin::Promocode.last)
  end

  test "should show admin_promocode" do
    get admin_promocode_url(@admin_promocode)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_promocode_url(@admin_promocode)
    assert_response :success
  end

  test "should update admin_promocode" do
    patch admin_promocode_url(@admin_promocode), params: { admin_promocode: { end: @admin_promocode.end, name: @admin_promocode.name, start: @admin_promocode.start, type: @admin_promocode.type, value: @admin_promocode.value } }
    assert_redirected_to admin_promocode_url(@admin_promocode)
  end

  test "should destroy admin_promocode" do
    assert_difference('Admin::Promocode.count', -1) do
      delete admin_promocode_url(@admin_promocode)
    end

    assert_redirected_to admin_promocodes_url
  end
end
