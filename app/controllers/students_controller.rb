class StudentsController < ApplicationController
  before_action :authenticate_teacher!
  before_action :set_student, only: [:edit, :update, :destroy]

  def index
    @students = current_teacher.students
  end

  def new
    @student = current_teacher.students.new
  end

  def create
    student = current_teacher.students.find_or_initialize_by(
      name: student_params[:name],
      subject: student_params[:subject]
    )

    if student.new_record?
      student.assign_attributes(student_params)
      flash_message = "Student was successfully added."
    else
      student.marks = student_params[:marks].to_i # Update marks
      flash_message = "Marks updated for #{student.name}."
    end

    if student.save
      redirect_to students_path, notice: flash_message
    else
      flash.now[:alert] = "Error saving student."
      render :index
    end
  end

  def edit
    # @student is set by the before_action
  end

  def update
    if @student.update(student_params)
      redirect_to students_path, notice: 'Student updated successfully.'
    else
      flash.now[:alert] = "Error updating student."
      render :edit
    end
  end

  def destroy
    if @student.destroy
      flash[:notice] = 'Student was successfully deleted.'
    else
      flash[:alert] = 'There was an issue deleting the student.'
    end

    respond_to do |format|
      format.html { redirect_to students_path }
      format.js # Optional: respond with JavaScript if using AJAX
    end
  end

  private

  def set_student
    @student = current_teacher.students.find(params[:id])
  end

  def student_params
    params.require(:student).permit(:name, :subject, :marks)
  end
end
