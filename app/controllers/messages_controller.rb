class MessagesController < ApplicationController

  def send_message
    # @user = User.find(params[:id])
    to_phone = ENV['TO_PHONE'].to_s
    account_sid = ENV['TWILIO_ACCOUNT_SID']
    auth_token = ENV['TWILIO_AUTH_TOKEN']
    twilio_number = ENV['TWILIO_NUMBER'].to_s
    @client = Twilio::REST::Client.new account_sid, auth_token

    message_body = ""
    message_body += current_user.user_name
    message_body = " says hello!"

    @client.account.messages.create({
      :from => twilio_number, 
      :to => to_phone, 
      :body => message_body, 
    })
        
  end
end
