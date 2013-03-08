class AccountsController < ApplicationController
  def show
    @stylesheet = "index"
    @stylesheets = "jcarousel_account"
    @javascripts = "jquery.jcarousel.min.js"
    @projects = Project.all
  end
end
