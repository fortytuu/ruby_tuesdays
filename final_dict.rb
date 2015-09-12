# This program was made by Vera

words = {"Haus" => "house", "Hund" => "dog", "Katze" => "cat"}
language = ["German", "English"]
instruction = {"C" => "change", "A" => "add", "D" => "delete"}
mode = " "
errors = ["Correct!", "First guess was wrong. Try again.", "Wrong again. One try left.", "Nope. Sorry that was your last chance."]

class Hash
  def shuffle
    Hash[self.to_a.sample(self.length)]  # Hash[] turns array into hash again, self.to_a -> turns hash (=self) into array, .sample(of size hash.length) gibt zufällig gemischtes array wieder 
  end

  def shuffle!
    self.replace(self.shuffle)
  end
end

while mode != "E" # Exit option
	puts "Press [L] to list the current dictionary, [P] to practice, [C] to change existing word-pairs, [A] to add new words, [D] to delete words or [E] to exit."
	mode = gets.chomp.upcase

	if instruction.keys.include?(mode)
		puts "Please enter the German word for the word-pair you'd like to #{instruction[mode]}."
		current_german = gets.chomp
		# add new dictionary entries
		if mode == "A" 											
			puts "Now enter the English equivalent."
			words[current_german] = gets.chomp
		# delete entries
		elsif mode == "D" 									
			words.delete(current_german)
		# change dictionary entries
		elsif mode == "C" 									
			puts "Would you like to change the German part [0] or the English part [1]?"
			choice = gets.to_i
			puts "Please enter the new #{language[choice]} word."
			if choice == 0
				# words.delete() deletes key and returns value which is then stored with new key
				words[gets.chomp] = words.delete(current_german) 		
			elsif choice == 1
				# replaces old value with new value
				words[current_german] = gets.chomp									
			end
		end
	elsif mode == "L"
		puts "\nCurrent dictionary"					
		puts "------------------"
		words.each do |german, english|
			puts "#{german} - #{english}"
		end
		puts "------------------" 
	# practice existing word pairs
	elsif mode == "P"											
		counter = 0
		puts "Please choose which association you want to practice: [0] for German-English [1] for English-German"
		association = gets.to_i
		words.shuffle.each do |german_word, english_word|
			#short version of if/else condition, choose which language you want to translate
			word, translation = association == 0 ? [german_word, english_word] : [english_word, german_word]
			puts "\nPlease translate #{word}. (Type 'skip' to see next word.)"
			wrong = 0

			while wrong < 3
				input = gets.chomp
				if input.downcase == "skip"
					puts "Ok, skipping."
					break
				elsif input == translation
					puts errors[0]
					counter += 1
					break
				else
					wrong += 1
					puts errors[wrong]
					if wrong == 3
						puts "The correct answer was #{translation}."
					end
				end	
			end
		end
		puts "\nYou got #{counter} word(s) correct on first try."
	end
end