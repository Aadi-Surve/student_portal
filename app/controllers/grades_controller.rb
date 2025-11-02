class GradesController < ApplicationController
  before_action :set_grade, only: [:show, :edit, :update, :destroy]

  # GET /grades
  # GET /grades.json
  def index
    @grades = Grade.includes(:student, :course).all

    respond_to do |format|
      format.html  # renders index.html.erb
      format.json  # renders index.json.jbuilder
    end
  end

  # GET /grades/:id
  # GET /grades/:id.json
  def show
    respond_to do |format|
      format.html  # renders show.html.erb
      format.json  # renders show.json.jbuilder
    end
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      respond_to do |format|
        format.html { redirect_to @grade, notice: 'Grade was successfully created.' }
        format.json do
          render json: {
            status: "success",
            message: "Grade was successfully created.",
            data: {
              student: @grade.student.name,
              course: @grade.course.name,
              grade: @grade.grade
            }
          }, status: :created
        end
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json do
          render json: { status: "error", errors: @grade.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    if @grade.update(grade_params)
      respond_to do |format|
        format.html { redirect_to @grade, notice: 'Grade was successfully updated.' }
        format.json do
          render json: {
            status: "success",
            message: "Grade was successfully updated.",
            data: {
              student: @grade.student.name,
              course: @grade.course.name,
              grade: @grade.grade
            }
          }, status: :ok
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json do
          render json: { status: "error", errors: @grade.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @grade.destroy
    respond_to do |format|
      format.html { redirect_to grades_url, notice: 'Grade was successfully deleted.' }
      format.json do
        render json: { status: "success", message: "Grade was successfully deleted." },
               status: :ok
      end
    end
  end

  private

  def set_grade
    @grade = Grade.find(params[:id])
  end

  def grade_params
    params.require(:grade).permit(:student_id, :course_id, :grade)
  end
end
