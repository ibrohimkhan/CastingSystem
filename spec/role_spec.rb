require_relative '../role'

describe Casting::Role do
	context "Object initialization" do
		it "expects to raise error on wrong object initialization" do 
			expect { Casting::Role.new("Ottela", 0..10, 'male') }.to raise_error
		end
	end
end