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

desc 'This task will send a reminder email to all users when called by the Heroku scheduler'

task :send_reminders => :environment do
  User.find_each do |user|
    begin
      ReminderEmailJob.perform_later(user)
    rescue => e
      puts e.message
    end
  end
end
