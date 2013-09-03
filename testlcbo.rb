require 'json'
require 'open-uri'

class HtmlGenerator
  
  attr_accessor :product_names, :product_prices, :product_categories, :product_image_urls
  
  def initialize(product_names, product_prices, product_categories, product_image_urls)
    @product_names = product_names
    @product_prices = product_prices
    @product_categories = product_categories
    @product_image_urls = product_image_urls
  end
  
  
  def index
    puts "HtmlGenerator: index"
    raw_response = open("http://lcboapi.com/products").read
    
    #parse JSON-formatted text into a ruby hash
    parsed_response = JSON.parse(raw_response)
    
    #REturn the actual result data from your response, ignoring metadata
    
    products = parsed_response["result"]
    
    final_page = parsed_response["pager"]["final_page"]
      
    for i in 1..20 
        raw_reponse = open("http://lcboapi.com/products?page=#{i}").read
        parsed_response = JSON.parse(raw_response)
        
        for j in 0..parsed_response["result"].length-1
          product = parsed_response["result"][j]["name"]
            price = parsed_response["result"][j]["price_in_cents"]
          category= parsed_response["result"][j]["primary_category"]
          image = parsed_response["result"][j]["image_url"]
          
          @product_names << product
          @product_prices << price
          @product_categories << category
          @product_image_urls << image 
          end
        end

      
  end
  
  def show(product_id)
    
      puts "HtmlGenerator: show #{product_id}"
      
      raw_response = open("http://lcboapi.com/products/#{product_id}").read
      parsed_response = JSON.parse (raw_response)
    
     return parsed_response
    
    end
  end