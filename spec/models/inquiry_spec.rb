require 'spec_helper'

describe Inquiry do

  describe "validations: " do
    it { should have_valid(:first_name).when("Paul") }
    it { should_not have_valid(:first_name).when(nil, '') }

    it { should have_valid(:last_name).when("Dornfeld") }
    it { should_not have_valid(:last_name).when(nil, '') }

    it { should have_valid(:email).when("pdornfel@gmail.com") }
    it { should_not have_valid(:email).when(nil, '') }

    let(:invalid_emails) { ['blah.com', 'blah@blank', 'foo', '.com', '@@'] }
    it { should_not have_valid(:email).when(*invalid_emails) }

    it "should have a unique email" do
      user_one = FactoryGirl.build(:inquiry)
      user_two = FactoryGirl.build(:inquiry)

      expect(user_one.save).to eq true
      expect(user_two.save).to eq false
    end

    it { should have_valid(:subject).when("Very Important") }
    it { should_not have_valid(:subject).when(nil, '') }

    it { should have_valid(:description).when("blah") }
    it { should_not have_valid(:description).when(nil, '') }
  end
end
