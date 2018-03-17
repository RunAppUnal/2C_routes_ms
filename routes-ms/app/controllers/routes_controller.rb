class RoutesController < ApplicationController
  before_action :set_route, only: [:show, :update, :destroy]

  # GET /routes
  def index
    @routes = Route.all

    render json: @routes
  end

  # GET /routes/1
  def show
    render json: @route
  end

  # POST /routes
  def create
    @route = Route.new(route_params)

    if @route.save
      render json: @route, status: :created, location: @route
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /routes/1
  def update
    if @route.update(route_params)
      render json: @route
    else
      render json: @route.errors, status: :unprocessable_entity
    end
  end

  # DELETE /routes/1
  def destroy
    @route.destroy
  end

  def add_user
    if (Route.checkUserInRoute == false)
      Route.addUSer(params[:id], params[:userid])
    end
  end

  def check_user
    Route.checkUserInRoute
  end

  def remove_user
    if (Route.checkUserInRoute == true)
      removeUser(params[:id], params[:userid])
    end      
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_route
      @route = Route.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def route_params
      params.require(:route).permit(:user_id, :car_id, :title, :description, :from_lat, :from_lng, :to_lat, :to_lng, :waypoints, :departure, :cost, :users_in_route, :active, :spaces_available)
    end
end
