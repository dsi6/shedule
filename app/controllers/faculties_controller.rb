#encoding:utf-8
class FacultiesController < ApplicationController
before_filter :check_admin_user, :except=>['index', 'show']
  def index
    @faculties = Faculty.all

    respond_to do |format|
      format.html 
      format.json { render :json => @faculties }
    end
  end

  def show
    @faculty = Faculty.includes(:groups).find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @faculty }
    end
  end

  def new
    @faculty = Faculty.new

    respond_to do |format|
      format.html
      format.json { render :json => @faculty }
    end
  end

  def edit
    @faculty = Faculty.find(params[:id])
  end

  def create
    @faculty = Faculty.new(params[:faculty])

    respond_to do |format|
      if @faculty.save
        format.html { redirect_to @faculty, :notice => 'Факультет создан.' }
        format.json { render :json => @faculty, :status => :created, :location => @faculty }
      else
        format.html { render :action => "new" }
        format.json { render :json => @faculty.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @faculty = Faculty.find(params[:id])

    respond_to do |format|
      if @faculty.update_attributes(params[:faculty])
        format.html { redirect_to @faculty, :notice => 'Факультет отредактирован.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @faculty.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @faculty = Faculty.find(params[:id])
    @faculty.destroy

    respond_to do |format|
      format.html { redirect_to faculties_url }
      format.json { head :ok }
    end
  end
end
