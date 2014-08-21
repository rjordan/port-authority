class Image
  attr_reader :id, :tags

  def self.all
    Docker::Image.all.map { |i| create_from_docker(i) }
  end

  def self.find(id)
    id_string = id.to_s
    image = create_from_docker(Docker::Image.all.select{ |i| i.id == id_string }.first)
    return unless image
    #image.update_from_details Docker::Image.get(id_string)
    image
  end

  def self.delete(id)
    image = Docker::Image.get(id.to_s)
    image.remove if image
    true
  end

  private

  def self.create_from_docker(image_data)
    return unless image_data
    image = Image.new
    image.instance_variable_set('@id', image_data.id)
    image.instance_variable_set('@tags', image_data.info['RepoTags'])
    image
  end

  def update_from_details(image_data)
  end

end
