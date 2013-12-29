class ApiProductsController < ApiApplicationController
  def price_lookup
    product_numbers = params[:pn].split(',')
    @date = params[:asofdate] ? Date.parse(params[:asofdate]) : Time.now
    @products = Product.where(product_number: product_numbers)
    if @products.present?
      found_product_numbers = @products.map(&:product_number)
      @missing_product_numbers = (product_numbers - found_product_numbers).uniq
    else
      render json: {products: [], not_found: product_numbers}
    end
  end

end