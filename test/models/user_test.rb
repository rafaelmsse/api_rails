require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'user with a vlidade email should be valid' do
    user = User.new(email: 'teste@teste.com', password_digest: 'teste')
    assert user.valid?
  end

  test 'user with invalid email should be invalid' do
    user =  User.new(email: 'teste', password_digest: 'test')
    assert_not user.valid?
  end

  test 'user with duplicate email should be invalid' do
    user1 = users(:one)
    user2 = User.new(email: user1.email, password_digest: 'teste')
    assert_not user2.valid?
  end
end
