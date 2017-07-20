def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    # create an empty array
    students = []
    # get the first name
    # while the name is not emplty, repeat this code
    name = gets.chomp
    while !name.empty? do # as they have to press enter twice to stop it
        puts "What cohort are they in?"
        cohort = gets.gsub(/\n/,"")
        cohort = 'november'if cohort == ""
        puts "Have any hobbies?"
        hobbies = gets.chomp
        puts "Country of birth?"
        country = gets.chomp
        puts "Height?"
        height  = gets.chomp
        # add the students hash to the array
        students << {name: name, cohort: cohort.to_sym, hobbies: hobbies, country: country, height: height}  # adding the hash to the array, with nov cohort
        puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}" # count on the array
        # get another name from the user
        puts "Next name please:"
        name = gets.chomp
    end
    # return the array of students
    students
end

def print_header
    puts "The students of my cohort at Makers Academy".center(100)
    puts "-----------".center(100)
end
  
def print(students)
    counter = 0
    until counter == students.size
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(100)
    puts "Addtional info:".center(100)
    puts "Hobbies: #{students[counter][:hobbies]}, Country of birth: #{students[counter][:country]}, height: #{students[counter][:height]}".center(100)
    counter += 1
    end
    puts "Students by cohort: ".center(100)
    
    cohort_sort = students.sort_by {|hash| hash[:cohort]}
    cohort_sort.each do |cohort_sort| 
        puts "#{cohort_sort[:cohort]}, #{cohort_sort[:name]}".center(100)
     end

end

def print_footer(students)
    puts "Overall, we have #{students.count} #{students.count == 1 ? "student" : "students"}".center(100)
end


# nothing happens until we call the methods

students = input_students    # calling the method input_students and putting the results in sudent
print_header
print(students)
print_footer(students)