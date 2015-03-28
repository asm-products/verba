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

desc 'This task will select new writing prompts every day when called by the Heroku scheduler'

task :select_prompt => :environment do
  RandomizePrompt.new.call
end
