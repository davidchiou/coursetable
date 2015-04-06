class CoursesController < ApplicationController
	def index
		@courses=Course.all
		if params[:coursename].present?
			@courses=@courses.where("coursename like ? ","%#{params[:coursename]}%")
		end
		if params[:time].present?
			@courses=@courses.where("time like ? ","%#{params[:time]}%")
		end
		if params[:teacher].present?
			@courses=@courses.where("teacher like ? ","%#{params[:teacher]}%")
		end
	end
	def new
		@course=Course.new
	end
	def create
		@course=Course.new(course_params)
		if  @course.save
			redirect_to root_path
		else
			render :new
		end
	end
	def show
		@course = Course.find(params[:id])
	end
	def edit
		@course = Course.find(params[:id])
	end
	def update
		@course = Course.find(params[:id])
		if  @course.update(course_params)
			redirect_to root_path
		
		else
			render :update
		end
	end
	def destroy
		@course = Course.find(params[:id])
		@course.destroy
		redirect_to root_path
	end
	private
	def course_params
		params.require(:course).permit(:coursename, :time, :teacher, :courseroom, :grade)
	end
end

