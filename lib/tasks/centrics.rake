namespace :centrics do
  desc "load products from salesforce"
  task :salesforce_product_load => :environment do
    Product.update_from_salesforce
  end
end