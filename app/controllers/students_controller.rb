class StudentsController < ApplicationController
  before_action :set_student, only: [:show, :edit, :update, :destroy]

  # GET /students
  def index
    @students = Student.all
    @students = @students.search(params[:search]) if params[:search].present?
    @students = @students.by_course(params[:course_id]) if params[:course_id].present?
    @courses = Course.all # For the filter dropdown

    respond_to do |format|
      format.html  # render normal HTML view
      format.json  # render app/views/students/index.json.jbuilder
    end
  end

  # GET /students/:id
  def show
    respond_to do |format|
      format.html  # render normal HTML view
      format.json  # render app/views/students/show.json.jbuilder
    end
  end

  # GET /students/new
  def new
    @student = Student.new
  end

  # POST /students
  def create
    @student = Student.new(student_params)
    if @student.save
      respond_to do |format|
        format.html { redirect_to @student, notice: 'Student was successfully created.' }
        format.json { render json: { status: 'success', message: 'Student created successfully', data: @student }, status: :created }
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json { render json: { status: 'error', message: @student.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # GET /students/:id/edit
  def edit
  end

  # PATCH/PUT /students/:id
  def update
    if @student.update(student_params)
      respond_to do |format|
        format.html { redirect_to @student, notice: 'Student was successfully updated.' }
        format.json { render json: { status: 'success', message: 'Student updated successfully', data: @student } }
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json { render json: { status: 'error', message: @student.errors.full_messages }, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /students/:id
  def destroy
    @student.destroy
    respond_to do |format|
      format.html { redirect_to students_url, notice: 'Student was successfully deleted.' }
      format.json { render json: { status: 'success', message: 'Student deleted successfully' } }
    end
  end

  private

  def set_student
    @student = Student.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    respond_to do |format|
      format.html { redirect_to students_url, alert: 'Student not found.' }
      format.json { render json: { status: 'error', message: 'Student not found' }, status: :not_found }
    end
  end

  def student_params
    params.require(:student).permit(:name, :email, :date_of_birth, :address, :phone, :enrollment_date, :image)
  end
end
