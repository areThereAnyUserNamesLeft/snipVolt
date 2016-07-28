class SnipsController < ApplicationController
	# before_action :require_signin!, except: [:show, :index]
  before_action :set_volt
  before_action :set_snip, only: [:show, :edit, :update, :destroy]

  def new
    @snip = @volt.snips.build
  end
  def show
  end
  def create
    @snip = @volt.snips.build(snip_params)
		@snip.author = current_user

    if @snip.save
      flash[:notice] = "Snip has been created."
      redirect_to [@volt, @snip]
    else
      flash[:alert] = "Snip has not been created."
      render "new"
    end
  end

  def edit
  end

  def update
    if @snip.update(snip_params)
      flash[:notice] = "Snip has been updated."

      redirect_to [@volt, @snip]
    else
      flash[:alert] = "Snip has not been updated."

      render action: "edit"
    end
  end

  def destroy
    @snip.destroy
    flash[:notice] = "Snip has been terminated with extreme prejudice"

    redirect_to @volt
  end

  private

    def set_volt
      @volt = Volt.find(params[:volt_id])
    end

    def set_snip
      @snip = @volt.snips.find(params[:id])
    end

    def snip_params
      params.require(:snip).permit(:snipOwner, :name, :language, :description, :summary, :readme, :licence, :volt, :voltOwner, :code)
    end
end
