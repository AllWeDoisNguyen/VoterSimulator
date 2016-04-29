require './voter.rb'
require './politician.rb'
require './modules.rb'
include PickParty


class America

	attr_accessor :voters, :politicians

	def initialize
		@voters = []
		@politicians = []

		start
	end 



	def start
		puts "Welcome to the American Voting Simulator!"
		main_menu
	end

	def main_menu
		puts "What would you like to do?"
		user_input("(C)reate, (L)ist, (U)pdate, or (D)elete", [:create, :list, :update, :delete], "c", "l", "u", "d")

	end


	def create
		puts "What would you like to create?"
		user_input("(P)olitician or (V)oter", [:make_politician, :make_voter], "p", "v")
	end

	def print_confirmation(args)
		args.each do |person|
			puts " *~*~*~*~*~*~*~*~*~*~*~*~*~*"
			puts "Name: " + person.name + ", Political Party: " + person.politics
			puts " *~*~*~*~*~*~*~*~*~*~*~*~*~*"
		end
	end

#make politician with a name and a party attribute. 
	def make_politician

		puts "Please name your politician:"
		@name = (gets.chomp.capitalize)
		@politics = assign_party
		@politicians << Politician.new(@name, @politics)
		print_confirmation(@politicians)
		
		main_menu
	end

	def make_voter
		puts "Please name your voter"
		@name = (gets.chomp.capitalize)
		@politics = assign_politics
		@voters << Voter.new(@name, @politics)
		print_confirmation(@voters)
		main_menu
	end

#List method should show everyone created.  Politician, Marco Rubio, Republican
#Voter, Juha Mikkola, Socialist
	def list
		puts ""
		puts " *~*~*~*~*~*~*~*~*~*~*~*~*~*"
		puts "Voters:"
		print_confirmation(@voters)
		
		puts "Politicians:"
		print_confirmation(@politicians)
		
		puts "Please (C)reate a person to view the (L)ist." if @voters.none? && @politicians.none?
		main_menu
	end

	def update #Checks to see if anyone was created, then allows to choose what to update
		if @voters.none? && @politicians.none?
			puts ""
			puts "Uhoh you haven't created anyone yet!"
			puts ""
			puts "Please (C)reate a person to (U)pdate."
			main_menu
		elsif 
			puts "Would you like to update a (V)oter or a (P)olitician?"
		end
		user_input("(P)olitician or (V)oter", [:update_pol, :update_vot], "p", "v")
	end

	def update_person
		puts "Name the politician you wish to update:"
		to_update = get_response # Name
		update_what = nil
		until update_what 
		puts "Would you like to update (N)ame or (P)arty?"
		update_what = get_response
			if update_what == "N"
				puts "What new name would you like to give that politician?"
				updated_name = get_response
				@politician = update_name(to_update, updated_name, @politicians)
			elsif update_what == "P"
				puts "What party do you want to change to?"
				assign_party
				update_party(to_update, politics, @politicians)
			end
		end
			main_menu
	end

	def update_vot
		puts "Name the voter you wish to update:"
		to_update = get_response
		update_what = nil
		until update_what 
		puts "Would you like to update (N)ame or (P)arty?"
		update_what = get_response
			if update_what == "N"
				puts "What new name would you like to give that voter?"
				updated_name = get_response
				@voters = update_name(to_update, updated_name, @voters)
			elsif update_what == "P"
				puts "What voting preference would you like to update to?"
				assign_politics
				update_party(to_update, politics, @voters)
			end
		end
			main_menu
	end

	def delete

		if @politicians.none? && @voters.none? 
			puts "Sorry, must create citizen."
			main_menu
		end
		
		puts "Are you deleting a (P)olitician or (V)oter? "
		if get_response == 'P'
			print_confirmation(@politicians)
			puts "Name the Politician you wish to delete"
			destroy(@politicians)
		elsif get_response == 'V'
			print_confirmation(@voters)
			puts "Name the Voter you wish to delete"
			destroy(@voters)
		end
		puts "That person has left America. The list has been updated."
		main_menu
			
	end

end 

America.new


