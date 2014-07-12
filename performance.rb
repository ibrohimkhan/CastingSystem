require_relative 'person'

module Casting
	class Performance
		attr_reader :role, :actor, :juries, :counter
		@@list_of_actors = {}
		
		def initialize(role, actor, juries)
			@role, @actor, @juries, @counter = role, actor, juries, 0
		end
		
		def show			
			raise "Actor/Role is not defined properly" if @actor.nil? || @role.nil?
			raise "You can play this role only one time" if @counter > 0									
			@counter += 1
			@actor.play @role.theme
		end
		
		def show_assessment
			avg_score = @juries.inject(0) { |sum, jury| sum += jury.do_performance_assessment( @actor ) } / @juries.size
			@@list_of_actors[@actor.name + ': ' + @role.theme] = avg_score unless @actor.name.nil? && @role.theme.nil? && avg_score.nil?
		end
		
		def self.get_high_scored_actor_by_role(role)
			max = @@list_of_actors.select { |k, v| k.include?(role.theme) }.values.max
			@@list_of_actors.select{ |k, v| v == max }
		end
		
	end
end