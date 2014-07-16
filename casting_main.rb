require_relative 'role'
require_relative 'person'
require_relative 'performance'

#---------------------------- Actors -------------------------
avraam = Casting::Actor.new("Avraam Russo", 32, 'male')
gosha = Casting::Actor.new("Gosha Kutzenko", 30, 'male')
angelina = Casting::Actor.new("Angelina Jolie", 31, 'female')

#---------------------------- Roles -------------------------
ivan_grozny = Casting::Role.new('Ivan Grozny', 30..60, 'male')
zorro = Casting::Role.new('Zorro', 25..45, 'male')
super_woman = Casting::Role.new('Lary Kraft', 30..50, 'female')

#------------------- Role and Scenario for Actors ------------------------
ivan_grozny_speech = "The assumption and active propaganda of the title of Czar, transgressions and sudden changes in policy during the Oprichnina contributed to the image of the Muscovite prince as a ruler accountable only to God."
avraam.assign_role_and_scenario( ivan_grozny, { duration: 15, text: ivan_grozny_speech } )
gosha.assign_role_and_scenario( ivan_grozny, { duration: 17, text: ivan_grozny_speech } )

zorro_speech = "Zorro is an agile athlete and acrobat, using his bullwhip as a gymnastic accoutrement to swing through gaps between city roofs, and is very capable of landing from great heights and taking a fall. Although he is a master swordsman and marksman, he has more than once demonstrated his prowess in unarmed combat against multiple opponents."
avraam.assign_role_and_scenario( zorro, { duration: 10, text: zorro_speech } )

super_woman_speech = "Jolie has attracted notable media attention for her physical appearance particularly her full lips and her many tattoos. She has been named the world's 'most beautiful' or 'sexiest' woman by various media outlets, including Vogue in 2002"
angelina.assign_role_and_scenario( super_woman, { duration: 5, text: super_woman_speech } )

#---------------------------- Juries -------------------------
oksana = Casting::Jury.new("Oksana Cherkova", 22, 'female')
pavel = Casting::Jury.new("Pasha Kirkorov", 30, 'male')
sergey = Casting::Jury.new("Sergey Karpov", 33, 'male')
khatabich = Casting::Jury.new("Starik Xatabich", 70, 'male')

# Creating Actor's Show
# Performance one
performance = Casting::Performance.new(ivan_grozny, avraam, [oksana, pavel, khatabich])
puts performance.show
puts "#{performance.actor.name}, the average score for the role #{performance.role.theme} is #{performance.show_assessment}"

# Show must go on... only one time....
#puts performance.show

# Performance two
zorro_performance = Casting::Performance.new(zorro, avraam, [pavel, khatabich, sergey])
puts zorro_performance.show
puts "#{zorro_performance.actor.name}, the average score for the role #{zorro_performance.role.theme} is #{zorro_performance.show_assessment}"

#Performance three
angelina_performance = Casting::Performance.new(super_woman, angelina, [oksana, khatabich])
puts angelina_performance.show
puts "#{angelina_performance.actor.name}, the average score for the role #{angelina_performance.role.theme} is #{angelina_performance.show_assessment}"

# Performance four
performance_evgeniy = Casting::Performance.new(ivan_grozny, gosha, [oksana, pavel, khatabich])
puts performance_evgeniy.show
puts "#{performance_evgeniy.actor.name}, the average score for the role #{performance_evgeniy.role.theme} is #{performance_evgeniy.show_assessment}"

# Show Actor's Total Speech Duration
puts "Total speech duration of #{avraam.name} is #{avraam.total_speech_duration}"
puts "Total speech duration of #{gosha.name} is #{gosha.total_speech_duration}"
puts "Total speech duration of #{angelina.name} is #{angelina.total_speech_duration}"

# Show high scored actor role
max_scored = Casting::Performance.get_high_scored_actor_by_role(ivan_grozny)
puts max_scored
