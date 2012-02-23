#encoding:utf-8
class ApplicationController < ActionController::Base
  include AuthenticatedSystem
  protect_from_forgery

  before_filter :check_user, :load_semester
  
  def check_user
    @current_user=current_user
  end

  def check_regular_user
    unless @current_user
      render :text=>"Доступ для незарегистрированных пользователей запрещен", :layout => 'application'
    end
  end

  def check_admin_user
    unless @current_user && @current_user.admin?
      render :text=>"Доступ запрещен", :layout => 'application'
    end
  end
  
  def load_semester
    if session[:semester_id].blank?
     t=Time.now.utc
      @current_semester=Semester.where("? BETWEEN stsem AND finsem",t).first
      #@current_semester=Semester.where(:year=>Time.now.year)
      session[:semester_id]=@current_semester.try(:id)
    else
      @current_semester=Semester.find(session[:semester_id])
    end
  end
end
