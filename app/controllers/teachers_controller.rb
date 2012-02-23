#encoding:utf-8
class TeachersController < ApplicationController
before_filter :check_admin_user, :except=>['index', 'show']
  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @teacher }
    end
  end

  def new
    @teacher = Teacher.new

    respond_to do |format|
      format.html 
      format.json { render :json => @teacher }
    end
  end

  def edit
    @teacher = Teacher.find(params[:id])
  end

  def create
    @teacher = Teacher.new(params[:teacher])

    respond_to do |format|
      if @teacher.save
        format.html { redirect_to @teacher, :notice => 'Преподаватель сохранен.' }
        format.json { render :json => @teacher, :status => :created, :location => @teacher }
      else
        format.html { render :action => "new" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @teacher = Teacher.find(params[:id])

    respond_to do |format|
      if @teacher.update_attributes(params[:teacher])
        fformat.html { redirect_to @teacher, :notice => 'Преподаватель отредактирован.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @teacher.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @teacher = Teacher.find(params[:id])
    @teacher.destroy

    respond_to do |format|
      format.html { redirect_to teachers_url }
      format.json { head :ok }
    end
  end
end
