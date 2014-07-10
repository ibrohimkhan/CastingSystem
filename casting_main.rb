require_relative 'role'
require_relative 'person'
require_relative 'performance'

# Creating Actors
ibrohim = Casting::Actor.new("Ibrohim Kholmatov", 32, 'male')
evgeniy = Casting::Actor.new("Evgeniy Vaulin", 30, 'male')
surik = Casting::Actor.new("Surayo Abdullaeva", 31, 'female')

# Creating Roles
ivan_grozny = Casting::ManRole.new(30..60, 'Ivan Grozny')
zorro = Casting::ManRole.new(25..45, 'Zorro')
super_woman = Casting::WomanRole.new(30..50, 'Angelina Jolie')

# Assigning Role and Scenario for Actors
ivan_grozny_speech = "The assumption and active propaganda of the title of Czar, transgressions and sudden changes in policy during the Oprichnina contributed to the image of the Muscovite prince as a ruler accountable only to God."
ibrohim.assign_role_and_scenario( ivan_grozny, { theme: "Ivan Grozny", duration: 15, text: ivan_grozny_speech } )
evgeniy.assign_role_and_scenario( ivan_grozny, { theme: "Ivan Grozny", duration: 17, text: ivan_grozny_speech } )

zorro_speech = "Zorro is an agile athlete and acrobat, using his bullwhip as a gymnastic accoutrement to swing through gaps between city roofs, and is very capable of landing from great heights and taking a fall. Although he is a master swordsman and marksman, he has more than once demonstrated his prowess in unarmed combat against multiple opponents."
ibrohim.assign_role_and_scenario( zorro, { theme: "Zorro", duration: 10, text: zorro_speech } )

super_woman_speech = "Jolie has attracted notable media attention for her physical appearance particularly her full lips and her many tattoos. She has been named the world's 'most beautiful' or 'sexiest' woman by various media outlets, including Vogue in 2002"
surik.assign_role_and_scenario( super_woman, { theme: "Angelina Jolie", duration: 5, text: super_woman_speech } )

# Creating Juries
oksana = Casting::Jury.new("Oksana Dushenkovskaya", 22, 'female')
pavel = Casting::Jury.new("Pavel Obod", 30, 'male')
sergey = Casting::Jury.new("Sergey Strizhov", 33, 'male')
khatabich = Casting::Jury.new("Starik Xatabich", 70, 'male')

# Creating Actor's Show
# Performance one
performance = Casting::Performance.new(ivan_grozny, ibrohim, [oksana, pavel, khatabich])
puts performance.show
puts "#{performance.actor.name}, the average score for the role #{performance.role} is #{performance.show_assessment}"

# Show must go on... only one time....
#puts performance.show

# Performance two
zorro_performance = Casting::Performance.new(zorro, ibrohim, [pavel, khatabich, sergey])
puts zorro_performance.show
puts "#{zorro_performance.actor.name}, the average score for the role #{zorro_performance.role} is #{zorro_performance.show_assessment}"

#Performance three
angelina_performance = Casting::Performance.new(super_woman, surik, [oksana, khatabich])
puts angelina_performance.show
puts "#{angelina_performance.actor.name}, the average score for the role #{angelina_performance.role} is #{angelina_performance.show_assessment}"

# Performance four
performance_evgeniy = Casting::Performance.new(ivan_grozny, evgeniy, [oksana, pavel, khatabich])
puts performance_evgeniy.show
puts "#{performance_evgeniy.actor.name}, the average score for the role #{performance_evgeniy.role} is #{performance_evgeniy.show_assessment}"

# Show Actor's Total Speech Duration
puts "Total speech duration of #{ibrohim.name} is #{ibrohim.total_speech_duration}"
puts "Total speech duration of #{evgeniy.name} is #{evgeniy.total_speech_duration}"
puts "Total speech duration of #{surik.name} is #{surik.total_speech_duration}"

# Show high scored actor role
max_scored = Casting::Performance.get_high_scored_actor_by_role(ivan_grozny)
puts max_scored
