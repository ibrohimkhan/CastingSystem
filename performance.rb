require_relative 'person'

module Casting
	class Performance
		attr_reader :role, :actor, :counter, :juries
		@@list_of_actors = {}
		
		def initialize(role, actor, juries)
			@role	 = role
			@actor	 = actor
			@juries	 = juries
			@counter = 0
		end
		
		def show			
			raise "Actor/Role is not defined properly" if @actor.nil? || @role.nil?
			raise "You can play this role only one time" if @counter > 0									
			@counter += 1
			@actor.play @role.theme
		end
		
		def show_assessment
			total_assessment = 0
			@juries.each do |jury|
				total_assessment += jury.do_performance_assessment( @actor )
			end
			
			avg_score = actor.score = total_assessment / @juries.size
			@@list_of_actors[@actor.name + '-' + @role.theme] = avg_score unless @actor.name.nil? && @role.theme.nil? && avg_score.nil?
			avg_score
		end
		
		def self.get_high_scored_actor_by_role(role)
			actor_with_same_roles = @@list_of_actors.select { |actor| actor.include?(role.theme) }
			max_value = actor_with_same_roles.values.max
			max_key = actor_with_same_roles.select { |k, v| v == max_value }
		end
		
	end
end