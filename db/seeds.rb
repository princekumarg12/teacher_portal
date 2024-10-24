
# Ensure there is a teacher to associate with the students
teacher = Teacher.create!(email: "teacher@example.com", password: "123456") unless Teacher.exists?(email: "teacher@example.com")

# Create 10 student records
10.times do |i|
  Student.create!(
    name: "Student #{i + 1}",
    subject: ["Math", "Science", "History", "English", "Art"].sample,
    marks: rand(50..100),
    teacher: teacher # Associate with the created teacher
  )
end

puts "10 students have been created!"
