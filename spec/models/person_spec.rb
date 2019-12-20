require 'rails_helper'

RSpec.describe Person, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"

  describe "ActiveModel validations" do
    it 'should be valid' do
      person = Person.find_or_create_by(full_name:"Hamsharan Mahalingam",sin:123456789,birthDate:"23-09-1988").should be_valid
    end
    person = Person.find_by(sin:123456789);
    it "expects sin to be valid numerical number" do
      expect(person.sin).to   eq(123456789)
      expect(person.full_name).to eql  "Hamsharan Mahalingam"
      # expect(person.birthDate,to_date).to eql ("23-09-1988").to_date
    end


  end
  describe "ActiveModel validations on numericality of sin and the presence of sin" do
    it 'should be in valid' do
      person = Person.create(full_name: "Hamsharan Mahalingam",sin:"a1234567ss",birthDate:"23-09-1988").should_not be_valid
    end
  end

end
