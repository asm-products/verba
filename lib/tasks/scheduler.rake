desc 'This task will select new writing prompts every day when called by the Heroku scheduler'

task :select_prompt => :environment do
  RandomizePrompt.new.call
end

desc 'This task will send writing prompts every day when called by the Heroku scheduler'

task :send_prompts => :environment do
  SendPrompts.new.call
end
