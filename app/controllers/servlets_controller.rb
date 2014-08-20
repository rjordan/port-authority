class ServletsController < ApplicationController
  def index
    @servlets = Servlet.order(:name).all
  end
end
