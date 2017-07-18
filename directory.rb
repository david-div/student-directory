# Let's put all students into an array
students = [
  "Dr. Hannibal Lector",
  "Darth Vader",
  "Nurse Ratchd",
  "Michael Corleone",
  "Alex DeLarge",
  "The Wicked Witch of the West",
  "Terminator",
  "Freddy Krueger",
  "The Joker",
  "Joffrey Baratheon",
  "Norman Bates"
  ]
# and then print them
puts "The student of Villains Academy"
puts "-----------"
students.each do |student|
    puts student
end
# finally we print the total
puts "Overall, we have #{students.count} great students"

