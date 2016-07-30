# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
unless User.exists?(email: "admin@snipVolt.xyz")
    User.create!(email: "admin@snipVolt.xyz", password: 'password', admin: true)
end
unless User.exists?(email: "sampleUser@snipVolt.xyz")
    User.create!(email: "sampleUser@snipVolt.xyz", password: 'password',)
end
["sampleUser's work volt", "sampleUser's home volt"].each do |name|
    unless Volt.create!(name: name, project_name: "A sampleUser's #{name}", default_licence: "MIT")
    end
end
