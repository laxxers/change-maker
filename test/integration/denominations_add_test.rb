require 'test_helper'

class DenominationsAddTest < ActionDispatch::IntegrationTest
  test "invalid denomination information" do
    get new_denomination_path
    assert_no_difference 'Denomination.count' do
      post denominations_path, denomination: { name:  "", value: 0.25 }
    end
    assert_template 'denominations/new'
  end
  
  test "valid denomination information" do
    get new_denomination_path
    assert_difference 'Denomination.count', 1 do
      post denominations_path, denomination: { name:  "quater", value: 0.25 }
    end
    follow_redirect!
    assert_template 'users/show'
  end
end
