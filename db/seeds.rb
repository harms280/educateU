# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Language.destroy_all
Course.destroy_all
User.destroy_all

languages = ["AngularJS", "Backbone.js", "Bootstrap", "C", "C#", "C++", "CSS", "Cassandra", "Clojure", "CoffeeScript", "D3.js", "Algorithms", "Django", "Docker", "Emacs", "Ember.js", "Express", "Firebase", "Git", "Grunt", "Gulp", "HTML", "HTML 5", "Hadoop", "Haskell", "Ionic", "iOS and Swift", "Java", "JavaScript", "jQuery", "LESS", "Meteor", "MongoDB", "MySQL", "Nginx", "Node.js", "PHP", "Perl", "PhoneGap", "Polymer", "Postgres", "Python", "R", "React", "Redis", "Regular Expressions", "RequireJS", "Ruby", "Ruby on Rails", "SEO", "SQL", "Sass", "Scala", "Sinatra", "Vim", "Visual Basic"]

languages.each do |x|
  Language.create({name: x})
end

# Language.create([{name: 'JavaScript'}, {name: 'Ruby'}, {name: 'Python'}, {name: 'AngularJS'}, {name: 'SQL'}, {name: 'HTML'}])
# Course.create({name: 'JavaScript Road Trip Part 1', description: 'An introduction to the very basics of the JavaScript language. Build a foundation of JavaScript syntax and learn how to use values, variables, and files.', cost: '0', skill_level: 'beginner', url: 'https://www.codeschool.com/courses/javascript-road-trip-part-1'})
# c = Course.last
# j = Language.first
# c.languages << j