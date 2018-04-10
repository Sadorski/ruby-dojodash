class StudentsController < ApplicationController
  def index
    @dojo = Dojo.find(params[:dojo_id])
    @students = @dojo.students
  end

  def new
    @dojo = Dojo.find(params[:dojo_id])
  end
  def create
    @dojo = Dojo.find(params[:dojo_id])
    Student.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:dojo])
    redirect_to "/dojos/#{params[:dojo]}/students"
  end

  def show
    @dojo = Dojo.find(params[:dojo_id])
    @student = @dojo.students.find(params[:id])
    @cohort = @dojo.students.where.not(id:params[:id])

  end
  def update
    @student = Student.find(:id)
    @student.update(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], dojo_id: params[:dojo])
    redirect_to "/dojos/#{params[:dojo]}/students"


  end

  def edit
    @dojo = Dojo.find(params[:dojo_id])
    @student = @dojo.students.find(params[:id])
  end

  def destroy
    @dojo = Dojo.find(params[:dojo_id])
    @student = Student.find(params[:id])
    @student.delete
    redirect_to "/dojos/#{@dojo.id}/students"
  end
end

