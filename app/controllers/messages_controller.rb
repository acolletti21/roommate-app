class MessagesController < ApplicationController

  def new
    @user = User.find(params[:id])
  end

  def send_message
    @user = User.find(params[:id])

    to_phone = ENV['TO_PHONE'].to_s
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER'].to_s

    message_body = ""
    message_body += current_user['user_name']
    message_body += " says hello!"
    message_body += params[:message_body_2]

    @client = Twilio::REST::Client.new account_sid, auth_token
    message = @client.account.messages.create({
      :from => twilio_number, 
      :to => "+1" + @user.phone, 
      :body => current_user.user_name + " from rooMe says " + params[:message_body_2], 
    })
    if message.sid
      flash[:success] = "Message Sent!"
      redirect_to "/users/#{@user.id}"
    else
      flash[:warning] = "Message failed, user does not have a number listed"
      redirect_to "/users/#{@user.id}"
    end
      
  end
end
