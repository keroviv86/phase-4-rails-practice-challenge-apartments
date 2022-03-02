class LeasesController < ApplicationController
    def index 
        render json: Lease.all, status: :ok
    end

    def create
        createLease = Lease.create!(lease_params)
        render json:createLease, status: :created

    end

    def destroy
        lease = find_lease
        lease.destroy
        head :no_content
    end

    private 
    def find_lease
        lease = Lease.find_by(id: params[:id])
    end  

    def lease_params 
        params.permit(:rent, :tenant_id, :apartment_id)
    end
end
