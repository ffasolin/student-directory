def input_students(students = [])
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  tbc = "TBC"
  name = gets.chomp
  name = tbc if name.empty?
  puts "Please enter the student's cohort"
  cohort = gets.chomp
  cohort = tbc if cohort.empty?
  months = %w(january february march april may june july august september october november december tbc)
  while !months.include? cohort.downcase
    puts "You misspelled the cohort, please type it again"
    cohort = gets.chomp
  end
  students << {name: name, cohort: cohort.to_sym} if name != tbc || cohort != tbc
  puts "Now we have #{students.count} students" if students.count > 1
  puts "Now we have #{students.count} student" if students.count < 2
  input_students(students) unless name == tbc && cohort == tbc
  students
end

def print_header
puts "The students of Villains Academy"
puts "--------------"
end

def print(students)
  hash_co = students.group_by { |entry| entry[:cohort] }
  hash_co.each do |key, value|
    puts key.capitalize
    for i in 0..value.length-1 do
    puts "#{i+1}. #{value[i][:name]}"
  end
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students" if names.count > 1
puts "Overall, we have #{names.count} great student" if names.count < 2
end

students = input_students
print_header
print(students)
print_footer(students)
