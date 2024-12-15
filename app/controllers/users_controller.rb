class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]
  before_action :build_labels, only: %i[ new create edit update ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @user.user_model = Doctor.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    MultiTenant.with(@hospital) do
      @user = User.new(user_params)
      @user.hospital = current_user.hospital

      if @user.save
        redirect_to users_path, notice: "User was successfully created."
      else
        render :new, status: :unprocessable_entity
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    MultiTenant.with(@hospital) do
      if @user.update(user_params)
        redirect_to users_path, notice: "User was successfully updated."
      else
        render :edit, status: :unprocessable_entity
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    def build_labels
      @positions = Service.where(category_code: :doctor_position).or(Service.where(category_code: :nurse_position))
    end

    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:family_name, :first_name, :email, :avatar, :user_model_type, user_model_attributes: [:id, :position_id])
    end
end
