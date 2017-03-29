@students = []

def print_menu
  puts "1. Input the students"
  puts "2. Show the students"
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit"
end

def load_students(filename = "students.csv")
  file = File.open(filename, "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(",")
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
end

def try_load_students
  filename = ARGV.first
  return if filename.nil?
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def show_students
  print_students_list
  print_footer
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant. Try again."
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def input_students(students = [])
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  tbc = "TBC"
  name = STDIN.gets.chop
  name = tbc if name.empty?
  puts "Please enter the student's cohort"
  cohort = STDIN.gets.chop
  cohort = tbc if cohort.empty?
  months = %w(january february march april may june july august september october november december tbc)
  while !months.include? cohort.downcase
    puts "You misspelled the cohort, please type it again"
    cohort = STDIN.gets.chop
  end
  @students << {name: name, cohort: cohort.to_sym} if name != tbc || cohort != tbc
  puts "Now we have #{students.count} students" if @students.count != 1
  puts "Now we have #{students.count} student" if @students.count == 1
  input_students(@students) unless name == tbc && cohort == tbc
end

def print_students_list
  if @students.count > 0
    puts "The students of Villains Academy"
    puts "--------------"
    hash_co = @students.group_by { |entry| entry[:cohort] }
    hash_co.each do |key, value|
      puts "#{key.capitalize} cohort"
      for i in 0..value.length-1 do
        puts "#{i+1}. #{value[i][:name]}"
      end
    end
  end
end

def print_footer
  if @students.count > 0
    puts "Overall, we have #{@students.count} great students" if @students.count != 1
    puts "Overall, we have #{@students.count} great student" if @students.count == 1
  end
end

try_load_students
interactive_menu
