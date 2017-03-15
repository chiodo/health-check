#Represents one instance of health data for a given cluster.  In theory, there will be many of these
#collected over time.
class ClusterHealthDatum < ActiveRecord::Base

  scope :most_recent, -> { order(created_at: :desc).limit(1).first}

  #
  def replica_by_type(type)
    database_status = doc['database']
    repl_status = database_status['replication_status']
    pg_stat_repl = repl_status['pg_stat_replication']

    pg_stat_repl.select {|inst| inst['application_name'] == type}.map {|a| Replica.new(a)}
  end


  def master
    Master.new doc['database'].except('replication_status')
  end


end
