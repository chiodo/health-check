class Cluster < ApplicationRecord
  has_many :cluster_health_data

  def healthy?
    #this is a guess at an approximation of "is this cluster healthy?"
    cluster_health_data.most_recent.doc['ok']
  end

  def standbys
    cluster_health_data.most_recent.replica_by_type('standby')
  end

  def followers
    cluster_health_data.most_recent.replica_by_type('follower')
  end

  def services
    cluster_health_data.most_recent.doc['services']
  end
end
