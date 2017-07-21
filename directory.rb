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
        cohort = 'November'if cohort == ""
        puts "Have any hobbies?"
        hobbies = gets.gsub(/\n/,"")
        puts "Country of birth?"
        country = gets.gsub(/\n/,"")
        puts "Height?"
        height  = gets.gsub(/\n/,"")
        # add the students hash to the array
        students << {name: name, cohort: cohort.capitalize.to_sym, hobbies: hobbies, country: country, height: height}  # adding the hash to the array, with nov cohort
        puts "Now we have #{students.count} #{students.count == 1 ? "student" : "students"}" # count on the array
        # get another name from the user
        puts "Next name please:"
        name = gets.gsub(/\n/,"")
    end
    # return the array of students
    students
end

def print_header
    puts "The students of my cohort at Makers Academy".center(100)
    puts "-----------".center(100)
end
  
def print(students)
    
    if students.size > 0
    
    counter = 0
    until counter == students.size
    puts "#{counter + 1}. #{students[counter][:name]} (#{students[counter][:cohort]} cohort)".center(100)
    puts "Addtional info:".center(100)
    puts "Hobbies: #{students[counter][:hobbies]}, Country of birth: #{students[counter][:country]}, Height: #{students[counter][:height]}".center(100)
    counter += 1
    end
    puts "Students by cohort: ".center(100)
    
    cohort_sort = students.sort_by {|hash| hash[:cohort]}
    cohort_sort.each do |cohort_sort| 
        puts "#{cohort_sort[:cohort]}: #{cohort_sort[:name]}".center(100)
     end

end

end

def print_footer(students)
    if students.count > 0
    puts "Overall, we have #{students.count} #{students.count == 1 ? "student" : "students"}".center(100)
    else
    puts " No students yets ".center(100, "~")
end
end

def interactive_menu
    students = []
    loop do
        # 1. print the menu and ask for the user what to do
        puts "1. Input the students"
        puts "2. Show the students"
        puts "9. Exit"
        # 2. read the input and save it into a variable
        selection = gets.chomp
        # 3. do what the user has asked    
        case selection
        when "1" then  students = input_students # calling the method input students
        when "2"
            print_header
            print(students)
            print_footer(students)
        when "9" then  exit  # this will cause the program to terminate
        else           puts "I don't know what you meant, try again"
        end
    
    end
end
# nothing happens until we call the methods

interactive_menu