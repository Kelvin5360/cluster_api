class ClusterStore

  def load
    if File.exist?(config_filename)
      configString = File.read File.join(CONFIG_PATH, "cluster.json")
      Cluster.new(MultiJson.load(configString, :symbolize_keys => true))
    else
      nil
    end
  end

  def save(cluster)
    File.open(config_filename, 'w') {|f| f.write(MultiJson.dump(cluster, :pretty => true))}
  end

  def config_filename
    File.join(CONFIG_PATH, "cluster.json")
  end
end
