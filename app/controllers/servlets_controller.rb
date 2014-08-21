class ServletsController < ApplicationController
  def index
    @servlets = Servlet.order(:name).all
  end

  def new
    @servlet = Servlet.new
  end
end
