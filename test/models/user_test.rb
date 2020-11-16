require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "test validate" do
    user = User.new
    assert_not user.valid?
    user.login = 'Test'
    assert user.valid?
  end
end
