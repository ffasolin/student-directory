def input_students
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  students = []
  name = gets.chomp
  while !name.empty? do
    students << {name: name, cohort: :november, country: "the UK", hobbies: "code, dance and travel", height: "185 cm"}
    puts "Now we have #{students.count} students"
    name = gets.chomp
  end
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
