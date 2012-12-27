class AccountsController < ApplicationController
  def show
    @stylesheet = "index"
    @projects = Project.all
  end
end
