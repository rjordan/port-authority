class ServletsController < ApplicationController
  def index
    @servlets = Servlet.order(:name).all
  end

  def new
    @image = Image.find(params[:image_id])
    @servlet = Servlet.new
  end

  def create
    render text: params.inspect
  end
end
