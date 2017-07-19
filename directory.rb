def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    # while the name is not emplty, repeat this code
    name = gets.chomp
    while !name.empty? do # as they have to press enter twice to stop it
        puts "Have any hobbies?"
        hobbies = gets.chomp
        puts "Country of birth?"
        country = gets.chomp
        puts "Height?"
        height  = gets.chomp
        # add the students hash to the array
        students << {name: name, cohort: :november, hobbies: hobbies, country: country, height: height}  # adding the hash to the array, with nov cohort
        puts "Now we have #{students.count} students" # count on the array
        # get another name from the user
        puts "Next name please:"
        name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of my cohort at Makers Academy"
    puts "-----------"
end
  
def print(students)
    counter = 0
    until counter == students.size
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)"
    puts "Addtional info:"
    puts "Hobbies: #{students[counter][:hobbies]}, Country: #{students[counter][:country]}, and height: #{students[counter][:height]}"
    counter += 1
    end
end

def print_footer(students)
    puts "Overall, we have #{students.count} great students"
end
# nothing happens until we call the methods
students = input_students
print_header
print(students)
print_footer(students)

