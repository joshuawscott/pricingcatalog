class ApiProductsController < ApiApplicationController
  def price_lookup
    product_numbers = params[:pn].split(',')
    upcase_product_numbers = product_numbers.map(&:to_s).map(&:upcase)
    @date = params[:asofdate] ? Date.parse(params[:asofdate]) : Time.now
    @products = Product.where("product_number in (?)", upcase_product_numbers)
    if @products.present?
      found_product_numbers = @products.map(&:product_number)
      @missing_product_numbers = (upcase_product_numbers - found_product_numbers).uniq
    else
      render json: {products: [], not_found: upcase_product_numbers}
    end
  end

end
