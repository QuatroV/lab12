require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get session_login_url
    assert_response :success
  end

  test 'should see input with signing in' do
    user = User.create(username: 'username', password: 'password', password_confirmation: 'password')
    post session_create_url, params: { login: user.username, password: 'password' }
    assert_redirected_to controller: :index, action: :input
  end

  test 'can logout after signing in' do
    user = User.create(username: 'username', password: 'password', password_confirmation: 'password')
    get session_logout_url
    assert_redirected_to controller: :session, action: :login
  end

end
