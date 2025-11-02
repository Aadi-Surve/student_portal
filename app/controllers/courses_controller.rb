class CoursesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /courses
  # GET /courses.json
  def index
    @courses = Course.all

    respond_to do |format|
      format.html  # renders index.html.erb
      format.json  # renders index.json.jbuilder
    end
  end

  # GET /courses/:id
  # GET /courses/:id.json
  def show
    respond_to do |format|
      format.html  # renders show.html.erb
      format.json  # renders show.json.jbuilder
    end
  end

  def new
    @course = Course.new
  end

  def create
    @course = Course.new(course_params)
    if @course.save
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course was successfully created.' }
        format.json do
          render json: {
            status: "success",
            message: "Course was successfully created.",
            data: {
              name: @course.name,
              code: @course.code,
              credits: @course.credits,
              teacher: @course.teacher&.name
            }
          }, status: :created
        end
      end
    else
      respond_to do |format|
        format.html { render :new }
        format.json do
          render json: { status: "error", errors: @course.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    end
  end

  def edit
  end

  def update
    if @course.update(course_params)
      respond_to do |format|
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json do
          render json: {
            status: "success",
            message: "Course was successfully updated.",
            data: {
              name: @course.name,
              code: @course.code,
              credits: @course.credits,
              teacher: @course.teacher&.name
            }
          }, status: :ok
        end
      end
    else
      respond_to do |format|
        format.html { render :edit }
        format.json do
          render json: { status: "error", errors: @course.errors.full_messages },
                 status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to courses_url, notice: 'Course was successfully deleted.' }
      format.json do
        render json: { status: "success", message: "Course was successfully deleted." },
               status: :ok
      end
    end
  end

  private

  def set_course
    @course = Course.find(params[:id])
  end

  def course_params
    params.require(:course).permit(:name, :code, :description, :credits, :teacher_id)
  end
end
