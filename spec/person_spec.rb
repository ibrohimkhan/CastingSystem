require_relative '../person'
require_relative '../role'

describe Casting::Person do
	context "checking person's gender" do
		let(:man) {Casting::Person.new("James Bond", 38, 'male')}
		let(:woman) {Casting::Person.new("Jenifer Lopez", 38, 'female')}
		
		it "is a male" do
			expect(man).to be_is_male
		end
		
		it "is a female" do
			expect(woman).to be_is_female
		end
	end	
end

describe Casting::Actor do
	let(:lady) {Casting::Actor.new("Maria Petrova", 19, 'female')}
	let(:vasya) {Casting::Actor.new("Vasily Petrov", 29, 'male')}
	let(:zorro_role) {Casting::Role.new("Zorro", 20..50, 'male')}
	let(:zorro_scenario_empty) {{}}
	let(:zorro_scenario) {{text: "Freedom", duration: 25}}
	
	it "is a young lady" do
		expect(lady).to be_young_lady
	end
	
	it "validate actor for the rigth role" do
		expect(vasya).to be_valid_actor_to_play(zorro_role)
	end
	
	it "assign empty scenario to actor" do
		expect {vasya.assign_role_and_scenario(zorro_role, zorro_scenario_empty)}.to raise_error
	end
	
	it "actor role list contains role and scenario" do
		vasya.assign_role_and_scenario(zorro_role, zorro_scenario)
		expect(vasya.actor_role_list).to include({ Zorro: ["Freedom", 25] })
	end
	
	it "raise error when playing role" do
		expect {vasya.play(zorro_role)}.to raise_error
	end
	
	it "plays role with no errors" do
		vasya.assign_role_and_scenario(zorro_role, zorro_scenario)
		expect {vasya.play(zorro_role.theme)}.not_to raise_error
	end
	
	it "contents of the played role" do
		vasya.assign_role_and_scenario(zorro_role, zorro_scenario)
		play = "Theme: #{zorro_role.theme}, Speech duration: #{vasya.actor_role_list[zorro_role.theme.intern][1]}, Debutant: #{vasya.name}"
		expect(vasya.play(zorro_role.theme)).to match(play)
	end
	
	it "total speech duration" do
		vasya.assign_role_and_scenario(zorro_role, zorro_scenario)
		expect(vasya.total_speech_duration).to be > 0
	end
end

describe Casting::Jury do
	let(:vasya) {Casting::Actor.new("Vasily Petrov", 29, 'male')}
	let(:zorro_role) {Casting::Role.new("Zorro", 20..50, 'male')}
	let(:zorro_scenario) {{text: "Freedom", duration: 25}}
	
	it "performance assessment" do
		vasya.assign_role_and_scenario(zorro_role, zorro_scenario)
		jury = Casting::Jury.new("Sidorov", 52, 'male')
		expect(jury.do_performance_assessment(vasya)).to be >= 0
	end
end