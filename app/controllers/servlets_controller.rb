class ServletsController < ApplicationController
  def index
    @servlets = Servlet.order(:name).all
  end

  def new
    @image = Image.find(params[:image_id])
    @servlet = Servlet.new
  end

  def create
    @servlet = Servlet.new(params_servlet)
    render text: @servlet.inspect
  end

private
  def params_servlet
    params.require(:servlet).permit(:name, :image)
  end
end
