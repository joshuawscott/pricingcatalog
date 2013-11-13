class CompetitorPricesController < ApplicationController
  before_action :set_competitor_price, only: [:show, :edit, :update, :destroy]

  # GET /competitor_prices
  # GET /competitor_prices.json
  def index
    @competitor_prices = CompetitorPrice.all
  end

  # GET /competitor_prices/1
  # GET /competitor_prices/1.json
  def show
  end

  # GET /competitor_prices/new
  def new
    @competitor_price = CompetitorPrice.new params[:competitor_price]
    @competitor_price.product_id ||= params[:product_id]
  end

  # GET /competitor_prices/1/edit
  def edit
  end

  # POST /competitor_prices
  # POST /competitor_prices.json
  def create
    @competitor_price = CompetitorPrice.new(competitor_price_params)

    respond_to do |format|
      if @competitor_price.save
        format.html { redirect_to @competitor_price.product, notice: 'Competitor Price was successfully created.' }
        format.json { render action: 'show', status: :created, location: @competitor_price }
      else
        format.html { render action: 'new' }
        format.json { render json: @competitor_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /competitor_prices/1
  # PATCH/PUT /competitor_prices/1.json
  def update
    respond_to do |format|
      if @competitor_price.update(competitor_price_params)
        format.html { redirect_to @competitor_price, notice: 'Competitor Price was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @competitor_price.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /competitor_prices/1
  # DELETE /competitor_prices/1.json
  def destroy
    @competitor_price.destroy
    respond_to do |format|
      format.html { redirect_to competitor_prices_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_competitor_price
      @competitor_price = CompetitorPrice.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def competitor_price_params
      params.require(:competitor_price).permit(:type, :price, :valid_date, :product_id)
    end
end
