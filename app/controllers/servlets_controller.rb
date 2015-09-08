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
    if @servlet.save
        redirect_to servlets_path
    else
        render :new
    end
  end

private
  def params_servlet
    params.require(:servlet).permit(:name, :image).tap do |wl|
        wl[:ports] = params[:servlet][:ports]
        wl[:volumes] = params[:servlet][:volumes]
    end
  end
end
