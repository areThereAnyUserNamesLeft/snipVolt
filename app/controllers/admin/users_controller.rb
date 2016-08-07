class Admin::UsersController < Admin::ApplicationController
    before_action :set_volts, only: [:new, :create, :edit, :update]
    before_action :set_user, only: [:show, :edit, :update, :destroy, :archive]

  def index
      @users = User.excluding_archived.order(:email)
  end
  def show
  end
  def new
      @user = User.new
  end
  def create
      @user = User.new(user_params)
      build_roles_for(@user)

      if @user.save
          flash[:notice] = "User spawned"
          redirect_to admin_users_path
      else
          flash.now[:user] = "User has not been created"
          render "new"
      end
end
def edit
end
def archive
    if @user == current_user
        flash[:alert] = "Cannot archive yourself"
    else
    @user.archive
    flash[:notice] = "User archived"
end
    redirect_to admin_users_path
end
def update
    if params[:user][:password].blank?
        params[:user].delete(:password)
    end

User.transaction do
    @user.roles.clear
    build_roles_for(@user)

    if @user.update(user_params)
        flash[:notice] = "User has been updated."
        redirect_to admin_users_path
    else
        flash.now[:alert] = "User has not been updated."
        render "edit"
        raise ActiveRecord::Rollback
    end
end
end
private
    def user_params
        params.require(:user).permit(:email, :password, :admin)
    end
    def set_user
        @user = User.find(params[:id])
    end
    def set_volts
        @volts = Volt.order(:name)
    end
    def build_roles_for(user)
        role_data = params.fetch(:roles,[])
        role_data.each do |volt_id, role_name|
            if role_name.present?
                @user.roles.build(volt_id: volt_id, role: role_name)
            end
        end
    end
end
