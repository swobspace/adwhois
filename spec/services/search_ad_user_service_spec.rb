require 'rails_helper'

RSpec.describe SearchAdUserService do
  let(:q) {{ query: ENV['LDAP_SEARCH_SN'] }}
  let(:ldap_options) {{
      :auth=>{:method=>:simple, :password=>"brabbel", :username=>"quark"}, 
      :base=>"dc=example,dc=org", 
      :encryption=>:simple_tls, 
      :host=>"nonexistent", 
      :port=>3269
  }}

  # check for class methods
  it { expect(SearchAdUserService.respond_to? :new).to be_truthy}

  # check for instance methods
  describe "instance methods" do
    subject { SearchAdUserService.new(q) }
    let(:call) { subject.call }
    it { expect(subject.respond_to? :call).to be_truthy}
    it { expect(call.respond_to? :success?).to be_truthy }
    it { expect(call.respond_to? :error_messages).to be_truthy }
    it { expect(call.respond_to? :ad_users).to be_truthy }
  end

  describe "with real environment" do
    subject { SearchAdUserService.new(q) }
    let(:call) { subject.call }

    it { expect(call.success?).to be_truthy }
    it { expect(call.error_messages).to be_empty }
    it { expect(call.ad_users.count).to be > 0 }
  end

  describe "#call" do
    subject { SearchAdUserService.new({ query: "a", ldap_options: [ldap_options] }) }

    it "calls Wobaduser::LDAP.new" do
      ldap = instance_double(Wobaduser::LDAP)
      ad_users = double("ImmutableStruct")
      expect(Wobaduser::LDAP).to receive(:new).with(ldap_options: ldap_options).and_return(ldap)
      expect(Wobaduser::User).to receive(:search).with(any_args).and_return(ad_users)
      expect(ldap).to receive(:errors).and_return([])
      expect(ad_users).to receive(:success?).and_return(false)
      expect(ad_users).to receive(:errors).and_return(["any error"])
      subject.call
    end
  end
end
