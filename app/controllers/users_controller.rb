class UsersController< ApplicationController
  def update
    bday = params[:birthday]
    name = Name.new
    harbinger_name = name.get_name
    search = NeoSearch.new.birthday_data(bday)
    id = search[:neo_id]
    generated_messages = Scope.new
    horrorscope_description = generated_messages.description
    horrorscope_date = generated_messages.date
    current_user.update!(birthday: bday)
    @message = PersonalMessage.create!(description: horrorscope_description, date: horrorscope_date, user_id: current_user.id)
    harbinger = current_user.harbingers.create!(neo_id: id, name: harbinger_name)
    require "pry"; binding.pry
    redirect_to personal_path
  end

  def edit
    @user = current_user
  end
end
