require 'spec_helper'

describe "Fingerprint" do
  describe "::for_offenders_of" do
    it "should return the fingerprints with criminal histories with the given incident type" do
      incident_type = IncidentType.where(name: "Armed Robbery").first

      robbers = Fingerprint.for_offenders_of(incident_type)
      robbers.count.should == 2

      incident_type.criminal_histories.each do |ch|
        ch.person.fingerprints.each do |fingerprint|
          robbers.should include(fingerprint)
        end
      end
    end
  end

  describe "::of_unknown_people" do
    it "should return fingerprints without an associated person" do
      Fingerprint.of_unknown_people.count.should == 2
    end
  end

  describe "::early_twentieth_century" do
    it "should return fingerprints taken between 1900 and 1930" do
      fingerprints = Fingerprint.early_twentieth_century

      fingerprints.count.should == 3

      @al_capone.fingerprints.each do |fingerprint|
        fingerprints.should include(fingerprint)
      end

      @john_dillinger.fingerprints.each do |fingerprint|
        fingerprints.should include(fingerprint)
      end
    end
  end
end
