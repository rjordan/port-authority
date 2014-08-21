class ImagesController < ApplicationController
  def index
    @images = Image.all
  end

  def destroy
    Image.delete(params['id'])
    redirect_to :back, notice: 'Image deleted!'
  end
end
