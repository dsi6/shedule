#encoding:utf-8
class SemestersController < ApplicationController 
before_filter :check_admin_user, :load_semester
  
  def index
      @semesters = Semester.all
      #@semesters=Semester.find(session[:semester_id])
  end

  def show
    @semester = Semester.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @semester }
    end
  end


  def new
    @semester = Semester.new

    respond_to do |format|
      format.html 
      format.json { render :json => @semester }
    end
  end

  def edit
    @semester = Semester.find(params[:id])
  end

  def create
    @semester = Semester.new(params[:semester])
    a = (@semester.stsem+6.day) < @semester.finsem 
    if a == false
      @semester.er
      render :action => "new"
      return
    end
    
    respond_to do |format|
      if @semester.save
        s = Semester.last
        Semester.update(s, :year=>s.stsem.year)
        format.html { redirect_to @semester, :notice => 'Семестр успешно создан' }
        format.json { render :json => @semester, :status => :created, :location => @semester }
      else
        format.html { render :action => "new" }
        format.json { render :json => @semester.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @semester = Semester.find(params[:id])

    respond_to do |format|
      if @semester.update_attributes(params[:semester])
        format.html { redirect_to @semester, :notice => 'Семестр обновлен.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @semester.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @semester = Semester.find(params[:id])
    @semester.destroy
    redirect_to semesters_url, :notice=>"Семестр удален"
  end  
end
