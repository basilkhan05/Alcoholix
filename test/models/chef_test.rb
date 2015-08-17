require "test_helper"

class ChefTest < ActiveSupport::TestCase

  def setup
    @chef = Chef.new(chefname: "john", email: "john@example.com")
  end
  
   test "chefname must must be present" do
     @chef.chefname = " "
    assert_not @chef.valid?
  end
  
  test "chef name should be valid" do
    assert @chef.valid?
  end 
  
   test "chef name should not be too long" do
    @chef.chefname = "a" * 41
    assert_not @chef.valid?
  end 
  
   test "chef name should not be too short" do
     @chef.chefname = "aa"
    assert_not @chef.valid?
  end 
  
  test "chef email should be present" do
     @chef.email = " "
    assert_not @chef.valid?
  end 
  
  test "chef name should be withing bounds" do
     @chef.email = "a" * 100 + "@example.com"
    assert_not @chef.valid?
  end 
  
  test "email address should be unique" do 
    dup_chef = @chef.dup
    dup_chef.email = @chef.email.upcase
    @chef.save
    assert_not dup_chef.valid?
  end
  
   test "email validation should accept valid addresses" do
     valid_addresses = %w[user@eee.com R_TDD-DS@eee.hello.org user@example.com first.last@eee.co laura+jo@mohc.cm]
     valid_addresses.each do |va|
      @chef.email = va
      assert @chef.valid?, '#{va.inspect} should be valid'
    end
  end 
  
   test "email validation should reject valid addresses" do
     invalid_addresses = %w[user_at_eee.com user.name@example. user@example,com eee@i_am_.com foo@ee+aar.com]
     invalid_addresses.each do |ia|
      @chef.email = ia
      assert_not @chef.valid?, '#{ia.inspect} should be valid'
    end
  end 
  
  
end