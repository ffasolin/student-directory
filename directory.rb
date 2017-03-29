def interactive_menu
  students = []
  loop do
    puts "1. Input the students"
    puts "2. Show the students"
    puts "9. Exit"
    selection = gets.chomp
    case selection
    when "1"
      students = input_students
    when "2"
        print(students)
        print_footer(students)
    when "9"
      exit
    else
      puts "I don't know what you meant. Try again."
    end
  end
end

def input_students(students=[])
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  tbc = "TBC"
  name = gets.chop
  name = tbc if name.empty?
  puts "Please enter the student's cohort"
  cohort = gets.chop
  cohort = tbc if cohort.empty?
  months = %w(january february march april may june july august september october november december tbc)
  while !months.include? cohort.downcase
    puts "You misspelled the cohort, please type it again"
    cohort = gets.chop
  end
  students << {name: name, cohort: cohort.to_sym} if name != tbc || cohort != tbc
  puts "Now we have #{students.count} students" if students.count != 1
  puts "Now we have #{students.count} student" if students.count == 1
  input_students(students) unless name == tbc && cohort == tbc
  students
end

def print(students)
  if students.count > 0
    puts "The students of Villains Academy"
    puts "--------------"
    hash_co = students.group_by { |entry| entry[:cohort] }
    hash_co.each do |key, value|
      puts "#{key.capitalize} cohort"
      for i in 0..value.length-1 do
        puts "#{i+1}. #{value[i][:name]}"
      end
    end
  end
end

def print_footer(names)
  if names.count > 0
    puts "Overall, we have #{names.count} great students" if names.count != 1
    puts "Overall, we have #{names.count} great student" if names.count == 1
  end
end

interactive_menu
print(students)
print_footer(students)
