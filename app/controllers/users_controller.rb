class UsersController< ApplicationController
  def update
    bday = params[:birthday]
    require "pry"; binding.pry
    harbinger_name = params[:harbinger_name]
    search = NeoSearch.new.birthday_data(bday)
    id = search[:neo_id]
    current_user.update!(birthday: bday)
    harbinger = current_user.harbingers.create!(neo_id: id, name: harbinger_name)
    # https://stark-ravine-66155.herokuapp.com/birthday?birthday=(birthday)

    redirect_to personal_path
  end

  def edit
    @user = current_user
  end
end
