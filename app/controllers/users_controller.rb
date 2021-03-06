class UsersController < ApplicationController
  skip_before_action :authorized, only: [:new, :create]

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
    
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    if @user.valid?
      
      if !@user.organization.blank?
        @user.reps_org = true;
        @organization = Organization.new
        @organization.name = @user.organization
        @organization.address = @user.address
        @organization.info = @user.orginfo
        @organization.save
        @user.save
        session[:user_id] = @user.id
        redirect_to "/organization/#{@organization.id}"
      else
        @user.reps_org = false
        @user.save
        session[:user_id] = @user.id
        redirect_to "/events"
      end
      
    else
      puts @user.errors.full_messages_for(:fname)
       render :new
       @user.errors.clear
     end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: "User was successfully updated." }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: "User was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Only allow a list of trusted parameters through.
    def user_params
      params.require(:user).permit(:email, :password, :fname, :lname, :organization, :address, :orginfo)
    end
end
