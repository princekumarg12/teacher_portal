require 'rails_helper'

RSpec.describe Student, type: :model do

  # Association tests
  it { should belong_to(:teacher) }

  # Validation tests
  it { should validate_presence_of(:name) }
  it { should validate_presence_of(:subject) }
  it { should validate_presence_of(:marks) }

  it 'is valid with a name and subject' do
    teacher = Teacher.create!(email: "teacher@example.com", password: "123456") unless Teacher.exists?(email: "teacher@example.com")
    student = teacher.students.new(name: 'John Doe', subject: 'Math', marks: 50)
    expect(student).to be_valid
  end

  it 'is invalid without a name' do
    teacher = Teacher.create!(email: "teacher@example.com", password: "123456") unless Teacher.exists?(email: "teacher@example.com")
    student = teacher.students.new(name: nil)
    expect(student).not_to be_valid
  end
end
