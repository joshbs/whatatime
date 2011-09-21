class TimeEntriesController < ApplicationController
  # GET /time_entries
  # GET /time_entries.xml
  def index
    @time_entries = TimeEntry.all

    respond_to do |format|
      format.html # index.html.
      format.json # index.json.
    end
  end

  def start
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.started_at = Time.now
    if @time_entry.save
      redirect_to(@time_entry)
    end
  end

  def stop
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.stopped_at = Time.now
    if @time_entry.save
      redirect_to(@time_entry)
    end
  end


  # GET /time_entries/
  def show
    @time_entry = TimeEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.
      format.json # show.html.
    end
  end

  # GET /time_entries/
  def new
    @time_entry = TimeEntry.new

    respond_to do |format|
      format.html # new.html.
    end
  end

  # GET /time_entries/1/edit
  def edit
    @time_entry = TimeEntry.find(params[:id])
  end

  # POST /time_
  def create
    @time_entry = TimeEntry.new(params[:time_entry])

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to(@time_entry, :notice => 'Time entry was successfully created.') }
        
      else
        format.html { render :action => "new" }
      end
    end
  end

  # PUT /time_entries/1
  # PUT /time_entries/1.xml
  def update
    @time_entry = TimeEntry.find(params[:id])

    respond_to do |format|
      if @time_entry.update_attributes(params[:time_entry])
        format.html { redirect_to(@time_entry, :notice => 'Time entry was successfully updated.') }
      else
        format.html { render :action => "edit" }
      end
    end
  end

  # DELETE /time_entries/1
  # DELETE /time_entries/1.xml
  def destroy
    @time_entry = TimeEntry.find(params[:id])
    @time_entry.destroy

    respond_to do |format|
      format.html { redirect_to(time_entries_url) }
      end
    end
  end

  # JSON
  
