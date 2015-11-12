require_relative 'controllers/menu_controller.rb'

menu = MenuController.new

system "clear"

puts "Welcome to AddressBloc!"

menu.main_menu