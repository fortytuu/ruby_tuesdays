#Version A
=begin
words = {"Haus" => "house", "Hund" => "dog", "Katze" => "cat"}

random_word = words.keys.sample

puts "Please translate " + random_word

user_translation = gets.chomp

if words[random_word] == user_translation
	puts "Correct!"
else
	puts "False!"
end
=end

#Version B
coffee = {"coffee" => "Kaffee"}
tea = {"tea" => "Tee"}
milk = {"milk" => "Milch"}
sugar = {"sugar" => "Zucker"}

dictionary = [coffee, tea, milk, sugar]
counter = 0

dictionary.each do |word|
	puts "\nPlease translate #{word.keys.first.upcase}. (Type 'skip' to see next word.)"
	input = gets.chomp

	if input == "skip"
		puts "Ok, skipping."
	elsif input == word.values.first
		puts "Correct!"
		counter += 1
	else
		wrong = 1
		while wrong < 3
			puts "Wrong, try again."
			input = gets.chomp
			if input == word.values.first
				puts "Correct" 
				break
			else	
				wrong += 1
				if wrong == 3
					puts "The correct answer was #{word.values.first.upcase}."
				end
			end
		end	
	end
end

puts "You got #{counter} word(s) correct on first trial."



