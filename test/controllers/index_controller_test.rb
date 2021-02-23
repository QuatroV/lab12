require 'test_helper'

class IndexControllerTest < ActionDispatch::IntegrationTest

  test "should not get the results without signing in" do
    post index_output_url, params: {num: 1.1}
    assert_response :redirect
  end

  test "should redirect to login without signing in" do
    get root_url
    assert_redirected_to controller: :session, action: :login
  end

end
