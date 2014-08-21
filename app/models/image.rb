class Image
  attr_reader :id, :tags

  def self.all
    Docker::Image.all.map { |i| create_from_docker(i) }
  end

  def self.find(id)
    image = Docker::Image.get(id)
    create_from_docker(image)
  end

  def self.delete(id)
    image = Docker::Image.get(id)
    image.remove if image
    true
  end

  private

  def self.create_from_docker(image_data)
    image = Image.new
    image.instance_variable_set('@id', image_data.id)
    image.instance_variable_set('@tags', image_data.info['RepoTags'])
    image
  end

end
