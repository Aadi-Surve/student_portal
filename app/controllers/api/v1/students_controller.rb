module Api
  module V1
    class StudentsController < Api::BaseController
      before_action :set_student, only: [:show, :update, :destroy]
      skip_before_action :authenticate_user!  # if using Devise

      def index
        @students = Student.all
        render json: @students.map { |student| student.as_json.merge(image_url: student.image.attached? ? url_for(student.image) : nil) }
      end

      def show
        render json: @student.as_json.merge(image_url: @student.image.attached? ? url_for(@student.image) : nil)
      end

      def create
        @student = Student.new(student_params)
        if @student.save
          render json: {
            status: 'success',
            message: 'Student created successfully',
            data: @student.as_json.merge(image_url: @student.image.attached? ? url_for(@student.image) : nil)
          }, status: :created
        else
          render json: { status: 'error', message: @student.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def update
        if @student.update(student_params)
          render json: {
            status: 'success',
            message: 'Student updated successfully',
            data: @student.as_json.merge(image_url: @student.image.attached? ? url_for(@student.image) : nil)
          }
        else
          render json: { status: 'error', message: @student.errors.full_messages }, status: :unprocessable_entity
        end
      end

      def destroy
        @student.destroy
        head :no_content
      end

      private

      def set_student
        @student = Student.find(params[:id])
      end

      def student_params
        params.require(:student).permit(
          :name,
          :email,
          :enrollment_number,
          :enrollment_date,
          :date_of_birth,
          :phone,
          :image
        )
      end
    end
  end
end
