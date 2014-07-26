desc "This task is called by the Heroku scheduler add-on"

task :send_notification => :environment do
  from = "+18457649208"
  to = "+19144825484"
  begin
    client = Twilio::REST::Client.new ENV["TWILIO_SID"], ENV["TWILIO_AUTH_TOKEN"]
    client.account.sms.messages.create(from: from, to: to, body: "Start writing.")
  rescue Twilio::REST::RequestError => e
    puts e.message
  end
end

task :get_daily_writing_prompt => :environment do
  require 'open-uri'
  doc = Nokogiri::HTML(open("http://www.reddit.com/r/WritingPrompts"))
  prompt = doc.css("a.title")[1].text.delete("[WP]")

  WritingPrompt.create!(prompt: prompt)
end
