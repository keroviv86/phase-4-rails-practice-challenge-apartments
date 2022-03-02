class TenantsController < ApplicationController
    def index   
        render json: Tenant.all, status: :ok
    end

    def create
        createTenant = Tenant.create!(tenant_params)
        render json: createTenant, status: :created
    end 

    def update
        tenant = find_tenant
        tenant.update!(tenant_params)
        render json: tenant, status: :ok
    end 
    def destroy
        tenant = find_tenant
        tenant.destroy
        head :no_content
    end 

    private
    def find_tenant
        tenant = Tenant.find_by(id: params[:id])
    end

    def tenant_params
        params.permit(:name, :age)
    end
end
