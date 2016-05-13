require 'test_helper'

class DenominationsEditTest < ActionDispatch::IntegrationTest
  def setup
    @denomination = denominations(:quaters)
  end

  test "unsuccessful edit" do
    get edit_denomination_path(@denomination)
    assert_template 'denominations/edit'
    patch denomination_path(@denomination), denomination: { name:  "", value: 0.25 }
    assert_template 'denominations/edit'
  end
  
  test "successful edit" do
    get edit_denomination_path(@denomination)
    assert_template 'denominations/edit'
    name  = "quarters"
    value = 0.25
    patch denomination_path(@denomination), denomination: { name: name, value: value }
    assert_not flash.empty?
    assert_redirected_to @denomination
    @denomination.reload
    assert_equal name,  @denomination.name
    assert_equal value, @denomination.value
  end
end
