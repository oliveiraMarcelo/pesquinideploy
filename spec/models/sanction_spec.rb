require 'spec_helper'
require 'rails_helper'

describe Sanction do

  before do
    @sanction = Sanction.new
    @sanction.process_number = "9090"
    @sanction.save
  end
  
  subject { @sanction }
    it { should respond_to(:process_number) }
  it { should be_valid }

  
  describe "uniqueness validation of process_number" do
    
    describe "unique process_number" do
      it "should be_valid" do
        uniqueness_sanction = Sanction.new
        uniqueness_sanction.process_number = "123" 
        expect(uniqueness_sanction).to be_valid
          end
        end
    describe "duplicated process_number" do
      it "should not be_valid" do
        duplicated_sanction = Sanction.new
        duplicated_sanction.process_number = "9090" 
        expect(duplicated_sanction).not_to be_valid
      end
    end
  

    describe "#refresh!" do
      before do
        @s = Sanction.new
        @s.process_number = "356754"
        @s.save
      end
      it "should return sanction" do
        expect(@s.refresh!).to eq(@s);
      end

      it "should not return other sanction" do
        expect(@s.refresh!).not_to eq(@sanction);
      end  
    end

  end   

end