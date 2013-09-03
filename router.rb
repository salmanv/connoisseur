require_relative 'html_generator'


if ARGV.empty?
	puts "Usage: ruby router.rb [action]"
else
	action, product_id = ARGV
	puts "dog dog"
	generator = HtmlGenerator.new


	if action == "index"
		generator.index
	elsif action == "show"
		generator.show(product_id)
	else
		puts "Unknown action #{action}. Use index or show."
	end
end