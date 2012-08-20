# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Role.delete_all
Role.create(name: 'site owner')
Role.create(name: 'manager')
Role.create(name: 'trustee')
Role.create(name: 'resident')
Role.create(name: 'non-resident')