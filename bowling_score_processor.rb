require_relative 'lib/game'

system "clear"

puts "Welcome! Thanks for using the Ruby Bowling Score Processor."
puts "Type in the filename of one of the following text files:\n"
puts "#  Description \t\t\t\t filename"
puts "1. Normal two player game \t\t example_1.txt"
puts "2. Perfect one player game \t\t example_2.txt"
puts "3. Zero score game \t\t\t example_3.txt"
puts "4. Game with too many moves \t\t example_4.txt"
puts "5. Game with too few moves \t\t example_5.txt"
puts "6. Game with invalid amount of moves \t example_6.txt"
puts "7. Game with invalid frame value \t example_7.txt"
puts "8. File with invalid characters \t example_8.txt"

game = Game.new

game.print_game()


