class PersonalController < ApplicationController
  def show
    @user = current_user
    neo_id = @user.harbingers.first.neo_id
    @harbinger = NeoSearch.new.harbinger(neo_id)

    unless @user.personal_messages.where(date: Date.today.to_s).empty?
      return @message = @user.personal_messages.where(date: Date.today.to_s).first
    else
      @message = PersonalMessage.create!(description: Scope.new.description, date: Date.today.to_s, user_id: current_user.id)
      @user.add_point
    end

    @date = @message.description[-10..-1]

  end

  def update
    @user = User.find(params[:user_id])
    @user.update!(points: 0)
    @user.save
    @user.personal_messages.last.update!(description: Scope.new("good").description)
    @user.personal_messages.last.save
    redirect_to "/personal"
  end

end
