module RequestHelpers
  include Warden::Test::Helpers

  # for use in request specs
  def sign_in_as_an_admin
    @user ||= FactoryGirl.create :user, admin: true
    login_as @user
  end
  def sign_in_as_a_user
    @user ||= FactoryGirl.create :user
    login_as @user
  end
end

RSpec.configure do |config|
  config.include Warden::Test::Helpers, :type => :request
  config.include RequestHelpers, :type => :request
end
