class UsersController< ApplicationController
  def update
    bday = params[:birthday]
    name = Name.new
    harbinger_name = name.get_name
    search = NeoSearch.new.birthday_data(bday)
    id = search[:neo_id]

    current_user.update!(birthday: bday)
    current_user.harbingers.create!(neo_id: id, name: harbinger_name)
    redirect_to personal_path
  end

  def edit
    @user = current_user
  end
end
