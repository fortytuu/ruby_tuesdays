input = ""

while true
	print "You:"
	input = gets.chomp
	if input.downcase.end_with?("bye")
		puts "Bob: Bye!"
		exit
	elsif input.empty?
		puts "Bob: Fine, be that way!"
	elsif input.upcase == input
		puts "Bob: Whoa, chill out!"
	elsif input.end_with?("?")
		puts "Bob: Sure."
	else
		puts "Bob: Whatever."
	end
end