class Image
  attr_accessor :id, :tags, :exposed_ports, :volumes

  def initialize
    self.tags = []
    self.exposed_ports = []
    self.volumes = []
  end

  def self.all
    Docker::Image.all.map { |i| create_from_docker(i) }
  end

  def self.find(id)
    id_string = id.to_s
    image = create_from_docker(Docker::Image.all.select{ |i| i.id == id_string }.first)
    return unless image
    image.update_from_details Docker::Image.get(id_string)
    image
  end

  def self.delete(id)
    image = Docker::Image.get(id.to_s)
    image.remove if image
    true
  end

  def update_from_details(image_data)
    self.exposed_ports = image_data.info['Config']['ExposedPorts'].try(:keys) || []
    self.volumes = image_data.info['Config']['Volumes'].try(:keys) || []
  end

  protected
  def self.create_from_docker(image_data)
    return unless image_data
    image = Image.new
    image.id = image_data.id
    image.tags = image_data.info['RepoTags']
    image
  end

end
