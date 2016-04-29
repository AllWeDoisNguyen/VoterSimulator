
module PickParty

	def assign_party
		
		proceed = nil

		until proceed
				puts "Please choose a party for your politician: (D)emocrat or (R)epublican"
				proceed = gets.chomp.downcase.squeeze

			case proceed
				
			when "d", "democrat"
				politics = "Democrat"
			when "r", "republican"
				politics = "Republican"
			else
				"Please enter [D] or [R]"
				proceed = nil
			end
		end
		politics
	end	

	def assign_politics

		politic_options = "Liberal, Conservative, Teaparty, Socialist, Neutral".split(/\W+/)

		user_politics = ""

		until politic_options.include?(user_politics)
			puts "Please assign voting politics: Liberal, Conservative, Tea Party, Socialist, or Neutral"
			puts "Please type the whole word:"
			user_politics = (gets.chomp.capitalize.delete(' '))
		end
		politics = user_politics
		if user_politics == "Teaparty"
				politics = "Tea Party"
			end
		politics	
	end

	def user_input(prompt, method_options=[], *option_buttons)
			
			users_choice = ""
			method_index = nil

			until option_buttons.include?(users_choice)
				puts prompt
				users_choice = gets.chomp.downcase
				option_buttons.each_with_index do |option_buttons, index|
					if users_choice == option_buttons
						method_index = index 
					end
				end
				
			end
			send(method_options[method_index]) #send will invoke the method that corresponds to the letter
			
	end

	def update_name(old_name, new_name, options_list=[])
		name_updated = false
		options_list.map! do |person|
			if person.name == old_name
				person.name = new_name
				name_updated = true
				puts "#{old_name} has been updated to #{new_name}"
			end
			break if name_updated
		end	
		puts "That name doesn't exist. Cannot update. "	unless name_updated
		options_list
	end

	def update_party(name, new_party, options_list=[])
		updated = false
		options_list.each do |person|
			if person.name == name
				person.politics = new_party
				updated = true
				puts "#{name} has joined the #{new_party} party."
			end
			break if updated
		end	
		puts "That name doesn't exist. Cannot update. "	unless updated
		options_list
	end
		
	def get_response # gets user response removing symbols and capitalizing words
		gets.chomp.gsub(/[^a-z ]/i, '').split.map(&:capitalize).join(' ')
	end

	def destroy(person_type)
	
		person_type.delete(person_type.find{|citizen| citizen.name == get_response})
	end

end




