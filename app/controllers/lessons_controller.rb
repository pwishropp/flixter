class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_user_enrollment
  
  def show
  end

  private

  def require_user_enrollment
    if !current_user.enrolled_in?(current_lesson.section.course)
    redirect_to course_url(current_lesson.section.course), alert: 'Please enroll to view lessons!'
    end
  end


  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end
end
