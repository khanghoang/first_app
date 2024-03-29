require 'spec_helper'

describe User do
  before do
    @user = User.new(name: "Example User", email: "user@example.com", 
                     password: "foobar", password_confirmation: "foobar")
  end  

  subject {@user}

  it {should respond_to(:name)}
  it {should respond_to(:email)}
  it { should respond_to(:password_digest) }
  it { should respond_to(:password) }
  it { should respond_to(:password_confirmation) }
  it { should respond_to(:authenticate) }
  it {should be_valid}
  # describe "name's not present" do
  # 	before {@user.name = " "}
  # 	it {should_not be_valid}
  # end
  # describe "email's not present" do
  # 	before {@user.email = " "}
  # 	it {should_not be_valid}
  # end
  # describe "name's too long" do
  # 	before {@user.name = "a" * 51}
  # 	it {should_not be_valid}
  # end
  # describe "when email is invalid" do
  #   it "should be invalid" do
  #     addresses = %w[user@goo,com user_at_foo.org example.user@foo.foo@bar_baz.com foo@bar+baz.com]
  #     addresses.each do |invalid_address|
  #       @user.email = invalid_address
  #       @user.should_not be_valid        
  #     end
  #   end    
  # end
  # describe "when email format is valid" do
  #   it "should be valid" do
  #     addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
  #     addresses.each do |valid_address|
  #       @user.email = valid_address
  #       @user.should be_valid
  #     end
  #   end
  # end
  describe "remember token" do
    before { @user.save }
    its(:remember_token) { should_not be_blank }
  end
end
