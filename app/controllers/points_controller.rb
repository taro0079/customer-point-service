class PointsController < ApplicationController
  before_action :set_point, only: %i[ show edit update destroy ]
  protect_from_forgery with: :null_session

  # GET /points or /points.json
  def index
    @points = Point.all
  end

  # GET /points/1 or /points/1.json
  def show
  end

  # GET /points/new
  def new
    @point = Point.new
  end

  def calculate
    customer = Customer.find(params[:customer_id])
    products = Product.where(id: params[:product_ids])
    adding_point = products.reduce(0){|sum, product| sum + product.get_point}
    point_after = customer.point.point + adding_point

    customer.point.update(point: point_after) if(false == params[:check_flag])

    render json: {adding_point: adding_point, point_after: point_after, customer_id: customer.id}
  end

  # GET /points/1/edit
  def edit
  end

  # POST /points or /points.json
  def create
    @point = Point.new(point_params)

    respond_to do |format|
      if @point.save
        format.html { redirect_to point_url(@point), notice: "Point was successfully created." }
        format.json { render :show, status: :created, location: @point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /points/1 or /points/1.json
  def update
    respond_to do |format|
      if @point.update(point_params)
        format.html { redirect_to point_url(@point), notice: "Point was successfully updated." }
        format.json { render :show, status: :ok, location: @point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /points/1 or /points/1.json
  def destroy
    @point.destroy

    respond_to do |format|
      format.html { redirect_to points_url, notice: "Point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point
      @point = Point.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def point_params
      params.require(:point).permit(:customer_id, :point)
    end
end
