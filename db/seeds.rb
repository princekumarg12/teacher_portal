
# Ensure there is a teacher to associate with the students
# teacher = Teacher.create!(email: "teacher@example.com", password: "123456") unless Teacher.exists?(email: "teacher@example.com")
teacher = Teacher.find_or_create_by(email: "teacher@example.com") do |new_teacher|
  new_teacher.password = "123456"
end

30.times do
  Student.create(
    name: Faker::Name.name,
    subject: Faker::Educator.subject,
    marks: Faker::Number.between(from: 50, to: 100),
    teacher_id: teacher.id
  )
end

puts "30 students have been created!"
