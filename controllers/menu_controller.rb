require_relative '../models/address_book.rb'

class MenuController
	attr_accessor :address_book

	def initialize
		@address_book = AddressBook.new
	end

	def main_menu
		puts "Main Menu - #{@address_book.entries.count} entries"
		puts "1 - View all entries"
		puts "2 - View entry by number"
		puts "3 - Create an entry"
		puts "4 - Search for an entry"
		puts "5 - Import entries from a CSV"
		puts "6 - Exit"
		print "Enter your selection: "

		selection = gets.to_i
		
		case selection
		when 1
			system "clear"
			view_all_entries
			main_menu
		when 2
			system "clear"
			view_entry_by_number
			main_menu
		when 3
			system "clear"
			create_entry
			main_menu
		when 4
			system "clear"
			search_entries
			main_menu
		when 5
			system "clear"
			read_csv
			main_menu
		when 6
			puts "Good-bye!"

			exit(0)
		else
			system "clear"
			puts "Sorry, that is not a valid input."
			main_menu
		end

	end

	def view_all_entries
		@address_book.entries.each do |entry|
			system "clear"
			puts entry.to_s
			entry_submenu(entry)
		end

		system "clear"
		puts "End of entries"
	end

	def view_entry_by_number
		print "Insert entry number: "
		entry_number = gets.chomp.to_i

		if @address_book.entries.count == 0
			puts "The Address Book is empty"
		elsif entry_number > @address_book.entries.count
			puts "We don't have such entry in our Address Book"
		else
			puts @address_book.entries[entry_number - 1].to_s
		end

	end

	def create_entry
		system "clear"
		puts "New AddressBloc Entry"

		print "Name: "
		name = gets.chomp
		print "Phone number: "
		phone_number = gets.chomp
		print "Email: "
		email = gets.chomp

		@address_book.add_entry(name, phone_number, email)

		system "clear"
		puts "New entry created."
	end

	def search_entries
	end

	def read_csv
	end

	def entry_submenu(entry)
		puts "n - next entry"
		puts "d - delete entry"
		puts "e - edit entry"
		puts "m - return to main menu"

		selection = gets.chomp

		case selection
		when "n"
		when "d"
		when "e"
		when "m"
			system "clear"
			main_menu
		else
			system "clear"
			puts "#{selection} is not a valid input"
			entry_submenu(entry)
		end
	end

end