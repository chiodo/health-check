#Simple controller to show cluster data
class ClustersController < ApplicationController
  before_action :set_cluster, only: [:show]

  # GET /clusters
  def index
    @clusters = Cluster.all
  end

  # GET /clusters/1
  def show
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cluster
      @cluster = Cluster.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def cluster_params
      params.require(:cluster).permit(:master_url, :name, :id)
    end
end
