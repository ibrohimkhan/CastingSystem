module Casting
	class Person
		attr_reader :name, :age, :gender
		
		def initialize(name, age, gender)
			@name, @age, @gender = name, age, gender
		end
			
		def is_male?
			@gender == 'male'
		end
		
		def is_female?
			@gender == 'female'
		end		
	end
	
	class Actor < Person
		attr_reader :text, :duration, :role, :actor_role_list
		
		def initialize(name, age, gender)
			super
			@actor_role_list = {}
		end
		
		def young_lady?
			is_female? && (18..25).include?(@age)
		end
		
		def valid_actor_to_play?(role)
			role.gender == @gender && role.age_range.include?(@age)
		end
		
		def assign_role_and_scenario(role, scenario)
			raise "You must assign role and scenario for the actor, #{@name}" if role.nil? || scenario.nil? || scenario.empty?
			raise "Actor, #{@name}, does not fit the role #{role.theme} by age/gender" unless valid_actor_to_play? role
			@role, @text, @duration = role, scenario[:text], scenario[:duration]
			@actor_role_list[@role.theme.intern] = [@text, @duration]
		end
				
		def play(role)
			raise "There is no scenario assigned for this Actor" if @text.nil? || @duration.nil? || @role.theme.nil?
			"Theme: #{role}, Speech duration: #{@actor_role_list[role.intern][1]}, Debutant: #{@name}"
		end
		
		def total_speech_duration
			actor_role_list.values.inject(0) { |sum, duration| sum += duration[1] }
		end								
	end
	
	class Jury < Person
		MAX_SCORE	= 10
		
		def do_performance_assessment(actor)
			return rand(7..MAX_SCORE) if actor.text.split.size > 30 && is_female?
			return rand(7..MAX_SCORE) if actor.is_female? && actor.young_lady? && is_male?
			rand(0..7)
		end		
	end
end