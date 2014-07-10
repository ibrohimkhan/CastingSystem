module Casting
	class Person
		attr_reader :name, :age, :gender
		
		def initialize(name, age, gender)
			@name 	= name
			@age 	= age
			@gender = gender
			@score 	= 0
		end
				
		def to_s
			@name + ' ' + @age.to_s + ' ' + @gender
		end
	end
	
	class Actor < Person
		attr_reader :text, :duration, :role, :actor_role_list
		attr_accessor :score
		
		def initialize(name, age, gender)
			super
			@actor_role_list = {}
		end
		
		def valid_actor_to_play?(role)
			role.get_gender == @gender && role.age.include?(@age)
		end
		
		def assign_role_and_scenario(role, scenario)
			raise "You must assign role and scenario for the actor, #{@name}" if role.nil? || scenario.nil?
			raise "Actor, #{@name}, does not fit the role #{role.theme} by age/gender" unless valid_actor_to_play? role
			@role = role
			@text, @duration = scenario[:text], scenario[:duration]
			@actor_role_list[@role.theme.intern] = [@text, @duration]
		end
				
		def play(role)
			raise "There is no scenario assigned for this Actor" if @text.nil? || @duration.nil? || @role.theme.nil?
			'Theme: ' + role + ', Speech: ' + @actor_role_list[role.intern].join(', ') + ', Debutant: ' + @name
		end
		
		def total_speech_duration
			total = 0
			actor_role_list.each do |k, v|
				total += v[1]
			end
			
			total
		end
								
	end
	
	class Jury < Person
		MAX_SCORE 	= 10
		MALE 		= 'male'
		FEMALE 		= 'female'
	
		def initialize(name, age, gender)
			super
		end
	
		def do_performance_assessment(actor)
			random_item = Random.new			
			if @gender == FEMALE
				return actor.text.split(' ').size > 30 ? random_item.rand(7..MAX_SCORE) : random_item.rand(0..7)			
			elsif @gender == MALE
				return actor.age.between?(18, 25) && actor.gender == FEMALE ? random_item.rand(7..MAX_SCORE) : random_item.rand(0..7)
			end
		end
	end
end