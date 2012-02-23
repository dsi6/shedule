#encoding:utf-8
class PlansController < ApplicationController
before_filter :check_admin_user, :except=>['index', 'show']
  def index
    @plans = Plan.all

    respond_to do |format|
      format.html
      format.json { render :json => @plans }
    end
  end

  def show
    @plan = Plan.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @plan }
    end
  end

  def new
    @plan = Plan.new

    respond_to do |format|
      format.html
      format.json { render :json => @plan }
    end
  end

  def edit
    @plan = Plan.find(params[:id])
  end

  def create
    @plan = Plan.new(params[:plan])

    respond_to do |format|
      if @plan.save
        format.html { redirect_to @plan, :notice => 'Сохранено.' }
        format.json { render :json => @plan, :status => :created, :location => @plan }
      else
        format.html { render :action => "new" }
        format.json { render :json => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @plan = Plan.find(params[:id])

    respond_to do |format|
      if @plan.update_attributes(params[:plan])
        format.html { redirect_to @plan, :notice => 'Отредактированно.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @plan.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @plan = Plan.find(params[:id])
    @plan.destroy

    respond_to do |format|
      format.html { redirect_to plans_url }
      format.json { head :ok }
    end
  end
end
