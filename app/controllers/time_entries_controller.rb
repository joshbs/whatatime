class TimeEntriesController < ApplicationController
  before_filter :authenticate_user!
  # GET /time_entries
  # GET /time_entries.xml

  def index
    @time_entries = current_user.time_entries.order("created_at DESC")

    respond_to do |format|
      format.html # index.html.
      format.json { render_for_api :default, json: @time_entries } # index.json.
    end
  end

  # GET /time_entries/
  def show
    @time_entry = TimeEntry.find(params[:id])

    respond_to do |format|
      format.html # show.html.
      format.json { render_for_api :default, json: @time_entry }
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
    @time_entry.user = current_user

    respond_to do |format|
      if @time_entry.save
        format.html { redirect_to(time_entries_path, notice: "#{@time_entry.name} was successfully created. #{undo_link}") }
        format.json { render_for_api :default, json: @time_entry }
      else
        format.html { render action: "new" }
      end
    end
  end

  # PUT /time_entries/1
  # PUT /time_entries/1.xml
  def update
    @time_entry = TimeEntry.find(params[:id])

    @time_entry.started_at  = Time.now  if params[:start]
    @time_entry.stopped_at  = Time.now  if params[:stop]
    @time_entry.archived    = true      if params[:archived]

    respond_to do |format|
      if @time_entry.update_attributes(params[:time_entry])
        format.html { redirect_to(time_entries_path, notice: "#{@time_entry.name} was successfully updated. #{undo_link}") }
        format.json { render_for_api :default, json: @time_entry }
      else
        format.html { render action: "edit" }
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

  private

  def undo_link
    view_context.link_to("undo", revert_version_path(@time_entry.versions.scoped.last), id: "undo", method: :post)
  end
end

