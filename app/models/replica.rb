class Replica
  include ActiveModel::Model

  attr_accessor :usename,
                :application_name,
                :client_addr,
                :backend_start,
                :state,
                :sent_location,
                :replay_location,
                :sync_priority,
                :sync_state,
                :sent_location_bytes,
                :replay_location_bytes,
                :replication_lag_bytes

  def attributes
    {'usename' => @usename,
     'application_name' => @application_name,
     'client_addr' => @client_addr,
     'backend_start' => @backend_start,
     'state' => @state,
     'sent_location' => @sent_location,
     'replay_location' => @replay_location,
     'sync_priority' => @sync_priority,
     'sync_state' => @sync_state,
     'sent_location_bytes' => @sent_location_bytes,
     'replay_location_bytes' => @replay_location_bytes,
     'replication_lag_bytes' => @replication_lag_bytes}
  end

  #determine if a replica is healthy, based on its offset and sync state
  def healthy?
    replication_lag_bytes < 1024 && state == 'streaming'
  end


end