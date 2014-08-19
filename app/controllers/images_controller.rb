class ImagesController < ApplicationController
  def index
    @images = Docker::Image.all
  end

  def destroy
    image = Docker::Image.get(params['id'])
    image.remove
    redirect_to :back, notice: 'Image deleted!'
  end
end
