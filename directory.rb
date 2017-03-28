def input_students(students = [])
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chomp
  puts "Please enter the student's cohort"
  cohort = gets.chomp
  cohort = "april" if cohort.empty?
  months = %w(january february march april may june july august september october november december)
  while !months.include? cohort
    puts "You misspelled the cohort, please type it again"
    cohort = gets.chomp
  end
  students << {name: name, cohort: cohort.to_sym} if !name.empty?
  puts "Now we have #{students.count} students"
  input_students(students) if !name.empty?
  students
end

def print_header
puts "The students of Villains Academy"
puts "--------------"
end

def print(students)
  d = 0
  while d < students.count
    str = "#{d+1}. #{students[d][:name]} (#{students[d][:cohort]} cohort)"
    puts str.center(str.length + 15)
    d += 1
  end
end

def print_footer(names)
puts "Overall, we have #{names.count} great students"
end

students = input_students
print_header
print(students)
print_footer(students)
