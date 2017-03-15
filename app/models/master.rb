#Simple representation of the master database status of the node in question
class Master
  include ActiveModel::Model

  attr_accessor :connect, :free_space, :archive_replication_status, :ok

  #do we have a connection to the main node and archive node
  def connect_ok?
    connect['main'] == 'ok' && connect['archive'] == 'ok'
  end

  #does our cluster have enough free disk space
  def free_space_ok?
    #todo: need real heuristic
    free_space['main']['inodes'] > 100000
  end

  #is the archive ok
  def archive_ok?
    #todo, we lack any real heuristic for this.
    true
  end
end