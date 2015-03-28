# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Prompt.create(content: "Why do you write?", prompt_of_the_day: true, used: true)
Prompt.create(content: "Write a story.", on_deck: true)
Prompt.create(content: "What was your favorite birthday? Why?")
Prompt.create(content: "Favorite movie? Why?")
Prompt.create(content: "What does your ideal day look like?")
Prompt.create(content: "Write about your childhood home.")
Prompt.create(content: "Which other career would you choose?")

