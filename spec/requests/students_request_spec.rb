require 'rails_helper'

RSpec.describe "Students", type: :request do
  let!(:teacher) { create(:teacher) }
  let!(:student) { create(:student, teacher: teacher) }
  let(:student_params) { { student: { name: 'John Doe', subject: 'Math', marks: 85 } } }
  let(:student_params1) { { student: { name: 'John Doe1', subject: 'Math', marks: 85 } } }

  before do
    login_as(teacher, scope: :teacher)
  end

  describe "GET /students" do
    it "returns a success response" do
      get students_path
      expect(response).to be_successful # checks for a successful response (status 200)
      expect(assigns(:students)).to include(student) # checks that the student is included in the response
    end
  end

  describe "POST /students" do
    context "with valid parameters" do
      it "creates a new Student" do
        expect {
          post students_path, params: student_params1
        }.to change(Student, :count).by(1) # ensures the student count increases
        expect(response).to redirect_to(students_path) # redirects to the index page
        expect(flash[:notice]).to eq("Student was successfully added.") # checks for flash message
      end
    end

    context "with invalid parameters" do
      it "does not create a new Student" do
        invalid_params = { student: { name: '', subject: '', marks: nil } }
        expect {
          post students_path, params: invalid_params
        }.to change(Student, :count).by(0) # ensures the student count does not change
        expect(response).to render_template(:index) # renders the index template
        expect(flash[:alert]).to eq("Error saving student.") # checks for flash alert
      end
    end
  end

  describe "PATCH /students/:id" do
    context "with valid parameters" do
      it "updates the requested student" do
        patch student_path(student), params: { student: { marks: 90 } }
        student.reload
        expect(student.marks).to eq(90) # checks if marks are updated
        expect(response).to redirect_to(students_path) # redirects to the index page
        expect(flash[:notice]).to eq('Student updated successfully.') # checks for flash message
      end
    end

    context "with invalid parameters" do
      it "does not update the student" do
        patch student_path(student), params: { student: { marks: nil, name: nil } }
        expect(response).to render_template(:edit) # renders the edit template
        expect(flash[:alert]).to eq("Error updating student.") # checks for flash alert
      end
    end
  end

  describe "DELETE /students/:id" do
    it "destroys the requested student" do
      expect {
        delete student_path(student)
      }.to change(Student, :count).by(-1) # ensures the student count decreases
      expect(response).to redirect_to(students_path) # redirects to the index page
      expect(flash[:notice]).to eq('Student was successfully deleted.') # checks for flash message
    end
  end
end