require 'rails_helper'

describe ReminderCopy do
  describe '.copy_for' do
    it "returns the daily copy for the user" do
      copy = ReminderCopy.create(week: 2, day: 1, subject: 'the reminder subject',
                                 copy: 'the reminder content.')
      user = double(weeks_since_registration: 2, week_day_since_registration: 1)

      expect(ReminderCopy.copy_for(user)).to eq(copy)
    end
  end
end
