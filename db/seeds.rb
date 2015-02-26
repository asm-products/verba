# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ReminderCopy.destroy_all
# 52.times do |week|
#   7.times do |day|
#     ReminderCopy.create(week: week, day: day, subject: "Subject week(#{week})-day(#{day})", copy: "Copy week(#{week})-day(#{day})")
#   end
# end
#

require 'csv'

email_copy_file = CSV.read(Rails.root.join("db/data/email_copy.csv"), headers: true)

day = 1
email_copy_file.each do |row|
  break if row["Week"].blank?

  ReminderCopy.create(
    week: row["Week"].scan(/\d/).join.to_i,
    day: "day",
    subject: row["Subject"],
    copy: row["Copy"] || "Will be filled in later",
    action: row["Action"],
    day: day
  )

  if day == 7
    day = 1
  else
    day += 1
  end
end
