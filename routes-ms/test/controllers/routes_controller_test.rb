require 'test_helper'

class RoutesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @route = routes(:one)
  end

  test "should get index" do
    get routes_url, as: :json
    assert_response :success
  end

  test "should create route" do
    assert_difference('Route.count') do
      post routes_url, params: { route: { active: @route.active, car_id: @route.car_id, cost: @route.cost, departure: @route.departure, description: @route.description, from_lat: @route.from_lat, from_lng: @route.from_lng, spaces_avaible: @route.spaces_avaible, title: @route.title, to_lat: @route.to_lat, to_lng: @route.to_lng, user_id: @route.user_id, users_in_route: @route.users_in_route, waypoints: @route.waypoints } }, as: :json
    end

    assert_response 201
  end

  test "should show route" do
    get route_url(@route), as: :json
    assert_response :success
  end

  test "should update route" do
    patch route_url(@route), params: { route: { active: @route.active, car_id: @route.car_id, cost: @route.cost, departure: @route.departure, description: @route.description, from_lat: @route.from_lat, from_lng: @route.from_lng, spaces_avaible: @route.spaces_avaible, title: @route.title, to_lat: @route.to_lat, to_lng: @route.to_lng, user_id: @route.user_id, users_in_route: @route.users_in_route, waypoints: @route.waypoints } }, as: :json
    assert_response 200
  end

  test "should destroy route" do
    assert_difference('Route.count', -1) do
      delete route_url(@route), as: :json
    end

    assert_response 204
  end
end
