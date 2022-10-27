require 'rails_helper'

RSpec.describe "ad_users/index.html.erb", type: :view do
  let(:double1) {double("Wobaduser::User").as_null_object}
  let(:double2) {double("Wobaduser::User").as_null_object}
  before(:each) do
    allow(controller).to receive(:controller_name) { "event_rules" }
    allow(controller).to receive(:action_name) { "index" }
    expect(double1).to receive(:sn).and_return("Fraser")
    expect(double2).to receive(:sn).and_return("Fraser")
    expect(double1).to receive(:givenname).and_return("James")
    expect(double2).to receive(:givenname).and_return("Claire")
    expect(double1).to receive(:l).and_return("Lallybroch")
    expect(double2).to receive(:l).and_return("Lallybroch")
    expect(double1).to receive(:department).and_return("Farming")
    expect(double2).to receive(:department).and_return("Farming")
    expect(double1).to receive(:mail).and_return("James.Fraser@highlands.org")
    expect(double2).to receive(:mail).and_return("Claire.Fraser@highlands.org")
    expect(double1).to receive(:telephonenumber).and_return("99979")
    expect(double2).to receive(:telephonenumber).and_return("99979")
    expect(double1).to receive(:facsimiletelephonenumber).and_return("99980")
    expect(double2).to receive(:facsimiletelephonenumber).and_return("99980")
    expect(double1).to receive(:mobile).and_return("none")
    expect(double2).to receive(:mobile).and_return("none")
    expect(double1).to receive(:username).and_return("jf@highlands")
    expect(double2).to receive(:username).and_return("claire@highlands")
    assign(:ad_users, [
      double1, double2
    ])
  end

  context "without valid login" do
    it "renders a list of event_rules" do
      render
      assert_select "label", :text => "Name, Vorname oder E-Mail-Adresse:".to_s, :count => 1
      skip "needs adaption to turbo stream"
      assert_select "tr>td", :text => "James".to_s, :count => 1
      assert_select "tr>td", :text => "Claire".to_s, :count => 1
      assert_select "tr>td", :text => "Fraser".to_s, :count => 2
    end
  end

  context "logged in" do
    before(:each) do
      @ability = Object.new
      @ability.extend(CanCan::Ability)
      allow(controller).to receive(:current_ability) { @ability }
    end

    it "renders a list of event_rules" do
      render
      assert_select "label", :text => "Name, Vorname oder E-Mail-Adresse:".to_s, :count => 1
      skip "needs adaption to turbo stream"
      assert_select "tr>td", :text => "James".to_s, :count => 1
      assert_select "tr>td", :text => "Claire".to_s, :count => 1
      assert_select "tr>td", :text => "Lallybroch".to_s, :count => 2
      assert_select "tr>td", :text => "Farming".to_s, :count => 2
      assert_select "tr>td", :text => "99979".to_s, :count => 2
      assert_select "tr>td", :text => "99980".to_s, :count => 2
      assert_select "tr>td", :text => "none".to_s, :count => 2
      assert_select "tr>td", :text => "James.Fraser@highlands.org".to_s, :count => 1
      assert_select "tr>td", :text => "jf@highlands".to_s, :count => 1
      assert_select "tr>td", :text => "Claire.Fraser@highlands.org".to_s, :count => 1
      assert_select "tr>td", :text => "claire@highlands".to_s, :count => 1
    end
  end
end
