#encoding:utf-8
class RoomsController < ApplicationController
before_filter :check_admin_user, :except=>['index', 'show']
  def index
    @rooms = Room.all
  end

  def show
    @room = Room.find(params[:id])

    respond_to do |format|
      format.html
      format.json { render :json => @room }
    end
  end

  def new
    @room = Room.new

    respond_to do |format|
      format.html
      format.json { render :json => @room }
    end
  end

  def edit
    @room = Room.find(params[:id])
  end

  def create
    @room = Room.new(params[:room])

    respond_to do |format|
      if @room.save
        format.html { redirect_to @room, :notice => 'Аудитория создана.' }
        format.json { render :json => @room, :status => :created, :location => @room }
      else
        format.html { render :action => "new" }
        format.json { render :json => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  def update
    @room = Room.find(params[:id])

    respond_to do |format|
      if @room.update_attributes(params[:room])
        format.html { redirect_to @room, :notice => 'Аудитория отредактированна.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @room.errors, :status => :unprocessable_entity }
      end
    end
  end

  def destroy
    @room = Room.find(params[:id])
    @room.destroy

    respond_to do |format|
      format.html { redirect_to rooms_url }
      format.json { head :ok }
    end
  end
end
