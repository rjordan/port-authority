class Image
  attr_reader :id

  def self.all
    Docker::Image.all
  end

  def self.find(id)
    image = Docker::Image.get(id)
    create_from_docker(image)
  end

  private

  def self.create_from_docker(image_data)
    image = Image.new
    image.instance_variable_set('@id', image_data.id)
    image
  end

end
