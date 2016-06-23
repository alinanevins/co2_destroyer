class UsersController < ApplicationController
  def index
    @user = User.all
  end

  def create
    user_hash = params.delete('user')
    a = User.new
    a.first_name = user_hash['first_name']
    a.last_name = user_hash['last_name']
    a.email = user_hash['email']
    a.university_or_school = user_hash['university_or_school']

    if a.save
      redirect_to user_path(a.id)
    end
  end

  def new
    @user = User.new
  end

  def edit
    id = params[:id]
    @user = User.find(id)
  end

  def show
    id = params[:id]
    @user = User.find(id)
  end

  def update
    id = params['id']
    user_hash = params.delete('user')
    @user = User.find(id)
    @user.first_name = user_hash['first_name']
    @user.last_name = user_hash['last_name']
    @user.email = user_hash['email']
    @user.university_or_school = user_hash['university_or_school']

    if @user.save
      redirect_to user_path(@user.id)
    end

  end

  def destroy
    id = params['id']
    User.delete(id)
    flash[:notice] = "You've deleted your account"
    redirect_to "/"
  end
end
