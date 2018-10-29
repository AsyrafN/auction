require 'rails_helper'

RSpec.describe User, type: :model do
 context "validations" do

   it "should contain name and email" do
     should have_db_column(:first_name).of_type(:string)
     should have_db_column(:last_name).of_type(:string)
     should have_db_column(:email).of_type(:string)
   end

   describe "validates the presence of the attributes" do
     it { is_expected.to validate_presence_of(:email) }
     it { is_expected.to validate_presence_of(:first_name) }
     it { is_expected.to validate_presence_of(:last_name) }

   end

   context "associations" do
     it { is_expected.to have_many(:products) }
     it { is_expected.to have_many(:authentications).dependent(:destroy) }
   end
 end
end