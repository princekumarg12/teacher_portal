require 'rails_helper'

RSpec.describe StudentsController, type: :controller do
  # Include Devise test helpers
  include Devise::Test::ControllerHelpers

  let!(:teacher) { create(:teacher) }
  let!(:student) { create(:student, teacher: teacher) }
  let(:valid_attributes) { { name: 'Jane Doe', subject: 'Science', marks: 85 } }
  let(:invalid_attributes) { { name: '', subject: 'Science', marks: 85 } }

  before do
    sign_in teacher # Sign in the teacher for tests
  end

  describe 'GET #index' do
    it 'returns a success response' do
      get :index
      expect(response).to be_successful
      expect(assigns(:students)).to eq([student])
    end
  end

  describe 'GET #new' do
    it 'returns a success response' do
      get :new
      expect(response).to be_successful
      expect(assigns(:student)).to be_a_new(Student)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Student' do
        expect {
          post :create, params: { student: valid_attributes }
        }.to change(Student, :count).by(1)
      end

      it 'redirects to the students list' do
        post :create, params: { student: valid_attributes }
        expect(response).to redirect_to(students_path)
        expect(flash[:notice]).to eq("Student was successfully added.")
      end
    end

    context 'with invalid params' do
      it 'does not create a new Student' do
        expect {
          post :create, params: { student: invalid_attributes }
        }.to change(Student, :count).by(0)
      end

      it 'renders the index template with an alert' do
        post :create, params: { student: invalid_attributes }
        expect(response).to render_template(:index)
        expect(flash.now[:alert]).to eq("Error saving student.")
      end
    end
  end

  describe 'GET #edit' do
    it 'returns a success response' do
      get :edit, params: { id: student.id }
      expect(response).to be_successful
      expect(assigns(:student)).to eq(student)
    end
  end

  describe 'PATCH #update' do
    context 'with valid params' do
      it 'updates the requested student' do
        patch :update, params: { id: student.id, student: { marks: 95 } }
        student.reload
        expect(student.marks).to eq(95)
      end

      it 'redirects to the students list' do
        patch :update, params: { id: student.id, student: { marks: 95 } }
        expect(response).to redirect_to(students_path)
        expect(flash[:notice]).to eq('Student updated successfully.')
      end
    end

    context 'with invalid params' do
      it 'does not update the student' do
        patch :update, params: { id: student.id, student: invalid_attributes }
        student.reload
        expect(student.name).to eq('John Doe') # Original name remains
      end

      it 'renders the edit template with an alert' do
        patch :update, params: { id: student.id, student: invalid_attributes }
        expect(response).to render_template(:edit)
        expect(flash.now[:alert]).to eq("Error updating student.")
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested student' do
      expect {
        delete :destroy, params: { id: student.id }
      }.to change(Student, :count).by(-1)
    end

    it 'redirects to the students list with a notice' do
      delete :destroy, params: { id: student.id }
      expect(response).to redirect_to(students_path)
      expect(flash[:notice]).to eq('Student was successfully deleted.')
    end
  end
end