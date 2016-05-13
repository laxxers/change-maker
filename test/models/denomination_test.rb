require 'test_helper'

class DenominationTest < ActiveSupport::TestCase
  def setup
    @denomination = Denomination.new(name: "quarters", value: 0.25)
  end
  
  test "should be valid" do
    assert @denomination.valid?
  end
  
  test "name should be present" do
    @denominations.name = "     "
    assert_not @denomination.valid?
  end
  
  test "value should be present" do
    @denomination.value = nil
    assert_not @user.valid?
  end
  
  test "name should not be too long" do
    @denomination.name = "a" * 51
    assert_not @denomination.valid?
  end
  
  test "value should not be too long" do
    @denomination.value = 9999999999999999999999999 * 244;
    assert_not @denomination.valid?
  end
  
  test "email addresses should be unique" do
    duplicate_denomination = @denomination.dup
    duplicate_denomination.name = @denomination.name.upcase
    @denomination.save
    assert_not duplicate_denomination.valid?
  end
  
  test "value should be present (nonblank)" do
    @denomination.value = nil
    assert_not @denomination.valid?
  end
end
