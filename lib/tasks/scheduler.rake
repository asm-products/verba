desc "This task is called by the Heroku scheduler add-on"

task :send_notification => :environment do
  User.all.each do |user|
    from = "+18457649208"
    to = "#{user.phone_number}"
    begin
      client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
      client.account.sms.messages.create(from: from, to: to, body: "Start writing.")
    rescue Twilio::REST::RequestError => e
      puts e.message
    end
  end
end

