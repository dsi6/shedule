#encoding:utf-8
class ChairsController < ApplicationController
before_filter :check_admin_user, :except=>['index', 'show']
  def index
    @chairs = Chair.all
  end

  def show
    @chair = Chair.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @chair }
    end
  end

  def new
    @chair = Chair.new

    respond_to do |format|
      format.html
      format.json { render :json => @chair }
    end
  end

  def edit
    @chair = Chair.find(params[:id])
  end

  def create
    @chair = Chair.new(params[:chair])

    respond_to do |format|
      if @chair.save
        format.html { redirect_to @chair, :notice => 'Кафедра сохранена.' }
        format.json { render :json => @chair, :status => :created, :location => @chair }
      else
        format.html { render :action => "new" }
        format.json { render :json => @chair.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @chair = Chair.find(params[:id])

    respond_to do |format|
      if @chair.update_attributes(params[:chair])
        format.html { redirect_to @chair, :notice => 'Кафедра обновлена.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @chair.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @chair = Chair.find(params[:id])
    @chair.destroy

    respond_to do |format|
      format.html { redirect_to chairs_url }
      format.json { head :ok }
    end
  end
end
