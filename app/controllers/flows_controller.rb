#encoding:utf-8
class FlowsController < ApplicationController

  def index
    @flows = Flow.all
    
    respond_to do |format|
      format.html 
      format.json { render :json => @flows }
    end
  end


  def show
    @flow = Flow.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @flow }
    end
  end


  def new
    @flow = Flow.new

    respond_to do |format|
      format.html 
      format.json { render :json => @flow }
    end
  end


  def edit
    @flow = Flow.find(params[:id])
  end


  def create
    @flow = Flow.new(params[:flow])

    respond_to do |format|
      if @flow.save
        format.html { redirect_to flows_group_path(@flow), :notice => 'Факультет сохранен' }
        format.json { render :json => @flow, :status => :created, :location => @flow }
      else
        format.html { render :action => "new" }
        format.json { render :json => @flow.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @flow = Flow.find(params[:id])

    respond_to do |format|
      if @flow.update_attributes(params[:flow])
        format.html { redirect_to flows_group_path(@flow.group), :notice => 'Факультет обновлен.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @flow.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @flow = Flow.find(params[:id])
    @flow.destroy

    respond_to do |format|
      format.html { redirect_to flows_url }
      format.json { head :ok }
    end
  end
  
  def items
    @flow = Flow.where(params[:id]) 
    @items = Item.where(:flow_id => Flow.where(:group_id => params[:id]))
  end
  
  def new_item
    @item = Item.where(:flow_id => Flow.where(:group_id => params[:id])).build
  end
  
end
