require "csv"
@students = [] # an empty array accessible to all methods

def input_students
    puts "Please enter the names of the students"
    puts "To finish, just hit return twice"
    name = STDIN.gets.chomp
    while !name.empty? do # as they have to press enter twice to stop it
        puts "What cohort are they in?"
        cohort = STDIN.gets.gsub(/\n/,"")
        cohort = 'November'if cohort == ""
        # add the students hash to the array
        student_array(name, cohort)
        puts "Now we have #{@students.count} #{student_or_students}" # count on the array
        puts "Next name please:"
        name = STDIN.gets.gsub(/\n/,"")
    end
end

def print_header
    puts "The students of my cohort at Makers Academy".center(100)
    puts "-----------".center(100)
end
  
def print_students_list(students)
    
    if @students.size > 0
    
    counter = 0
    until counter == @students.size
    puts "#{counter + 1}. #{@students[counter][:name]} (#{@students[counter][:cohort]} cohort)".center(100)
    counter += 1
    end
    puts "Students by cohort: ".center(100)
    
    cohort_sort = @students.sort_by {|hash| hash[:cohort]}
    cohort_sort.each do |cohort_sort| 
        puts "#{cohort_sort[:cohort]}: #{cohort_sort[:name]}".center(100)
     end
    end
end

def print_footer(students)
    if @students.count > 0
    puts "Overall, we have #{@students.count} #{student_or_students}".center(100)
    else
    puts " No students yets ".center(100, "~")
    end
end

def interactive_menu
    loop do
        print_menu
        process(STDIN.gets.chomp)  # passing gets.chomp as an arguement for the method
    end
end

def print_menu
        puts "1. Input the students"
        puts "2. Show the students"
        puts "3. Save the list to a file name: (default students.csv if nothing enterered)"
        puts "4. Load the list from file name: (default students.csv if nothing enterered)"
        puts "9. Exit"
end

def show_students
        print_header
        print_students_list(@students)
        print_footer(@students)
end

def process(selection)
        case selection
          when "1" then input_students
          when "2" then show_students  
          when "3" then save_students 
          when "4" then load_students    
          when "9" then  exit 
          else           puts "I don't know what you meant, try again"
        end
end

def save_students
    # open the file for writing
    filename = STDIN.gets.gsub(/\n/,"")
    filename = "students.csv" if filename == ""
    
    CSV.open(filename, "w") do |csv|
        @students.each do |student|
            csv << [student[:name], student[:cohort]]
        end
    end
    puts "The file has been saved to #{filename}"
end

def load_students(filename = "students.csv") # will default if nothing is entered
    filename = STDIN.gets.gsub(/\n/,"")
    filename = "students.csv" if filename == "" # filename didn't default when this wasn't in?
    
    CSV.foreach(filename) do |row|
    name, cohort = row[0], row[1]
    student_array(name, cohort)     # able to do student_array(row[0], row[1]) but this reads better
    end

    puts "#{filename} has succesfully been loaded"
end

def try_load_students
    filename = ARGV.first     # first arguement from the command line
#   filename = "students.csv" # will default, although you have to press enter
    return if filename.nil?
    if File.exists?(filename) # if it exists
        load_students(filename)
        puts "Loaded #{@students.count} from #{filename}" # the amount of students
     else # if it doesn't exist
        puts "Sorry, #{filename} doesn't exist."
        exit # quits the program
    end
end

def student_array(name, cohort)
    @students << {name: name, cohort: cohort.to_sym}
end

def student_or_students
    @students.count == 1 ? "student" : "students"
end

try_load_students
interactive_menu


