require 'rails_helper'

describe ReminderMailer do

	 before(:each) { MandrillMailer.deliveries.clear }

	 describe '.send_reminder' do
			it "sends a reminder copy for the given user" do
				 reminder_copy = ReminderCopy.create(week: 0, day: 0, subject: 'The subject',
																						 copy: 'The content' )
				 user = create(:user)
				 allow(ReminderCopy).to receive(:copy_for).with(user).and_return(reminder_copy)

				 ReminderMailer.send_reminder(user).deliver

				 email = MandrillMailer::deliveries.detect { |mail|
						mail.template_name == "daily-reminder" &&
							 mail.message['to'].any? { |to| to[:email] == user.email } &&
							 mail.message['global_merge_vars'].any?{ |var| var['name'] == 'CONTENT' &&
																								var['content'] == reminder_copy.copy }
				 }
				 expect(email).to_not be_nil
			end
	 end
end
