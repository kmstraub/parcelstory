require 'test_helper'

class ParcelsControllerTest < ActionController::TestCase
  setup do
    @parcel = parcels(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:parcels)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create parcel" do
    assert_difference('Parcel.count') do
      post :create, parcel: { address: @parcel.address, address_2: @parcel.address_2, city: @parcel.city, county: @parcel.county, latitude: @parcel.latitude, longitude: @parcel.longitude, name: @parcel.name, neighborhood: @parcel.neighborhood, post_id: @parcel.post_id, state: @parcel.state, zip: @parcel.zip }
    end

    assert_redirected_to parcel_path(assigns(:parcel))
  end

  test "should show parcel" do
    get :show, id: @parcel
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @parcel
    assert_response :success
  end

  test "should update parcel" do
    patch :update, id: @parcel, parcel: { address: @parcel.address, address_2: @parcel.address_2, city: @parcel.city, county: @parcel.county, latitude: @parcel.latitude, longitude: @parcel.longitude, name: @parcel.name, neighborhood: @parcel.neighborhood, post_id: @parcel.post_id, state: @parcel.state, zip: @parcel.zip }
    assert_redirected_to parcel_path(assigns(:parcel))
  end

  test "should destroy parcel" do
    assert_difference('Parcel.count', -1) do
      delete :destroy, id: @parcel
    end

    assert_redirected_to parcels_path
  end
end
