class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]


  # GET /users
  # GET /users.json
  def index
    @user = User.new
    @is_login = true
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by(uuid: params[:uuid])
  end

  # GET /users/new
  def new
    get_temporary_user
    # check if uuid is valid on temporary_users model
    redirect_to root_path if !@temporary_user
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation))
    respond_to do |format|
      if @user.save
        create_session
        format.html { redirect_to user_home_path, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { redirect_to :back }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end

    def get_temporary_user
      @temporary_user = TemporaryUser.find_by(uuid: params[:uuid])
    end

    def create_session
      if @user 
        u = User.where(email: @user.email).first
        # Store as a cookie in the users' browser with unique ID identifying them
        session[:user_uuid] = u.uuid.to_s
      end
    end
end
