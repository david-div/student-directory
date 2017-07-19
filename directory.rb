def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    name = gets.chomp
    # while the name is not emplty, repeat this code
    while !name.empty? do # as they have to press enter twice to stop it
        # add the students hash to the array
        students << {name: name, cohort: :november}  # adding the hash to the array, with nov cohort
        puts "Now we have #{students.count} students" # count on the array
        # get anoter name from the yser
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
    students.each_with_index do |student, index|
        puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
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
