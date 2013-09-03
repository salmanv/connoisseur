require 'json' 
require 'open-uri'


class HtmlGenerator 
	attr_accessor :products, :html_start, :html_end

	def initialize 
		raw_response = open("http://lcboapi.com/products").read
		
		parsed_response = JSON.parse(raw_response)

		@products = parsed_response["result"]

		@html_start = 
		[
			"<!DOCTYPE HTML>\n",
			"<html lang='en'>\n", 
			"<head>\n", 
			"<link rel='stylesheet' type='text/css' href='style.css'>\n",
			"<link rel='stylesheet' type='text/css' href='reset.css'>\n",
			"<title>CrunkJuice</title>\n",
			"</head>\n",
			"<body>\n"
		]

		@html_end = 
		[
		"</div> <!-- closdiv -->\n",
		"</div>  <!-- close container div -->\n",
		"<div id='footer'> something cheezy!!!</div> <!-- close footer div -->\n",
		"</body>\n",
		"</html>\n"
		]

	end


	def index

		@html_start.each do |tag| puts tag
		end
		puts "<div id='container'>"
		puts "<div id='header'>Liquid Happiness</div><!-- close header div -->" 
		puts "<div class='products'>"

		puts "<div class='container2'>"

		@products.each do |product| 

		puts "<div class='product_img'> "
		puts " <div class='id'> "
		puts " #{product['id']} "
		puts "</div>"
		puts " <img src='#{product["image_thumb_url"]}'> "
		puts "<div class='product_name'>"
		puts "#{product['name']}"
		puts "</div>"
		puts "</div>"
		end
		puts "</div>"

		@html_end.each do |tag| puts tag
		end
	end
	def show(product_id)
		@product.each do |product|
			if prodduct.fetch("id") == product_id.to_i
				product.each do |key, value| 
					puts "#{key}  :  #{value}"
				end
			end
		end
	end


end
