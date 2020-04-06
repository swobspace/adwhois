require 'rails_helper'

describe Adwhois do
  describe "::ldap_options" do
    context" with empty Settings" do
      before(:each) do
        allow(Adwhois::CONFIG).to receive(:[]).with('ldap_options').and_return(nil)
      end
      it { expect(Adwhois.ldap_options).to be_nil}
    end

    context" with existing Settings" do
      let(:ldap_options) {{
        "host"=>"192.0.2.71", 
        "port"=>3268, 
        "base"=>"dc=example,dc=com", 
        "auth"=>{
           "method"=>:simple, 
           "username"=>"myldapuser", 
           "password"=>"myldappasswd"
        }
      }}
      let(:ldap_options_ary) {[{
        "host"=>"192.0.2.71", 
        "port"=>3268, 
        "base"=>"dc=example,dc=com", 
        "auth"=>{
           "method"=>:simple, 
           "username"=>"myldapuser", 
           "password"=>"myldappasswd"
        }
      }]}
      let(:ldap_options_sym) {[{
        host: "192.0.2.71", 
        port: 3268, 
        base: "dc=example,dc=com", 
        auth: {
           method: :simple, 
           username: "myldapuser", 
           password: "myldappasswd"
        }
      }]}
      it "returns symbolized keys from Hash" do
        allow(Adwhois::CONFIG).to receive(:[]).with('ldap_options').
          and_return(ldap_options)
        expect(Adwhois.ldap_options).to eq(ldap_options_sym)
      end

      it "returns symbolized keys from Array of Hash" do
        allow(Adwhois::CONFIG).to receive(:[]).with('ldap_options').
          and_return(ldap_options_ary)
        expect(Adwhois.ldap_options).to eq(ldap_options_sym)
      end
    end
  end
end

