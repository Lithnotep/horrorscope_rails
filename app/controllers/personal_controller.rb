class PersonalController < ApplicationController
  def show
    @user = current_user
    unless PersonalMessage.where(date: Date.today.to_s).empty?
      return @message = PersonalMessage.where(date: Date.today.to_s).first
    else
      @message = PersonalMessage.create!(description: Scope.new.description, date: Date.today.to_s, user_id: current_user.id)
      @user.add_point
    end
    @date = @message.description[-10..-1]

    # @message = current_user.personal_messages.first.description

    neo_id = @user.harbingers.first.neo_id
    @harbinger = NeoSearch.new.harbinger(neo_id)
  end
end
