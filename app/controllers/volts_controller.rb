class VoltsController < ApplicationController
    before_action :set_volt, only: [:show, :edit, :update, :destroy]

    def index
        
    end
    def new
        @volt = Volt.new
    end
    def show

        @volts = Volt.all
    end
    def  edit

    end
    def update

        if @volt.update(volt_params)
            flash[:notice] = "Volt has been updated"
            redirect_to @volt
        else
            flash.now[:alert] = "Volt has not been updated"
            render 'edit'
        end
    end
    def destroy

        @volt.destroy

        flash[:notice] = "Volt has been terminated with extreme prejudice but the snips will live on"
        redirect_to volts_path
    end
    def create
        @volt = Volt.new volt_params

         if @volt.save
            flash[:notice] = "Volt made"
            redirect_to @volt

        else flash.now[:alert] = "Volt not made"
            render "new"
        end
    end
    private
    def volt_params
        params.require(:volt).permit( :name, :members_id, :project_name, :snips_id, :default_licence, :volt, :voltOwner, :code
)
    end
    def set_volt
        @volt = Volt.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "You seem to be looking for things that do not exist - why not try cryptozoology next time?"
        redirect_to volts_path
    end
end
