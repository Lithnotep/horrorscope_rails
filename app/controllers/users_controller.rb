class UsersController< ApplicationController
  def update
    bday = params[:birthday]
    current_user.update!(birthday: bday)
    redirect_to personal_path
  end

  def edit
    @user = current_user
  end
end
