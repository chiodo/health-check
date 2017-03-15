#job class that would periodically fetch cluster health data from remote sources
#Currently only utilizes local file data, but in real env would use remote resources.
class ClusterHealthCheckJob < ApplicationJob
  queue_as :default

  def perform(*args)
    #In reality, we'd have one job per cluster, but we only have one cluster here, so, this is ok
    clusters = Cluster.all
    clusters.each do |cluster|
      #fetch the json data, for now these are just a simple hard coded file reference, but would be remote url
      json_file = File.open "#{Dir.pwd}/#{cluster.master_url}"
      json_data = JSON.parse(json_file.read)
      puts "Here's #{cluster.name}'s JSON data: #{json_data}"
      #shove it in the datum table
      ClusterHealthDatum.create(cluster_id: cluster.id, doc: json_data)
    end
  end
end
