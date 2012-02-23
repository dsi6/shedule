#encoding:utf-8
class GroupsController < ApplicationController
  
  def index
    respond_to do |format|
      format.html{@groups = Group.includes(:faculty).all}
      format.json do
         @groups=Group.where("lower(numb_gr) LIKE lower(?)","%#{params[:q]}%").all
        render :json=>@groups.map(&:attributes)
      end
    end
  end


  def show
    @group = Group.find(params[:id])

    respond_to do |format|
      format.html 
      format.json { render :json => @group }
    end
  end


  def new
    @group = Group.new

    respond_to do |format|
      format.html
      format.json { render :json => @group }
    end
  end


  def edit
    @group = Group.find(params[:id])
  end


  def create
    @group = Group.new(params[:group])

    respond_to do |format|
      if @group.save
        format.html { redirect_to @group, :notice => 'Группа создана.' }
        format.json { render :json => @group, :status => :created, :location => @group }
      else
        format.html { render :action => "new" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end


  def update
    @group = Group.find(params[:id])

    respond_to do |format|
      if @group.update_attributes(params[:group])
        format.html { redirect_to @group, :notice => 'Группа отредактированна.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @group.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @group = Group.find(params[:id])
    @group.destroy

    respond_to do |format|
      format.html { redirect_to groups_url }
      format.json { head :ok }
    end
  end
  
  def flows
    #raise params.inspect
     @flows = Flow.where(:group_id => params[:id])
  end

  def new_flow
    @group = Group.find(params[:id])
    @flow = @group.flows.build
  end
   
end
