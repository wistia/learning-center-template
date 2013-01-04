class ProjectsController < ApplicationController
  def show
    @stylesheet = "project"
    @project = Project.where(hashed_id: params[:id]).first
    head :not_found and return unless @project
  end
end
