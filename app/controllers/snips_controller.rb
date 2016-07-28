class SnipsController < ApplicationController
    before_action :set_snip, only: [:show, :edit, :update, :destroy]
    def index
        @snips = Snip.all

    end
    def new
        @snip = Snip.new
    end
    def show

        @snips = Snip.all
    end
    def  edit

    end
    def update

        if @snip.update(snip_params)
            flash[:notice] = "Snip has been updated"
            redirect_to @snip
        else
            flash.now[:alert] = "Snip has not been updated"
            render 'edit'
        end
    end
    def destroy

        @snip.destroy

        flash[:notice] = "Snip has been terminated with extreme prejudice"
        redirect_to snips_path
    end
    def create
        @snip = Snip.new(snip_params)
        @snip.author = current_user

         if @snip.save
            flash[:notice] = "Snip made"
            redirect_to @snip

        else flash.now[:alert] = "Snip not made"
            render "new"
        end
    end
    private
    def snip_params
        params.require(:snip).permit(:snipOwner, :name, :language, :description, :summary, :readme, :licence, :volt, :voltOwner, :code
)
    end
    def set_snip
        @snip = Snip.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        flash[:alert] = "You seem to be looking for things that do not exist - why not try cryptozoology next time?"
        redirect_to snips_path
    end
end
