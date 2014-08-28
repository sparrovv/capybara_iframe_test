require 'rubygems'
require 'bundler'

Bundler.require(:default, :test)

require "./application"
require "test/unit"

Capybara.app = Application
Capybara.javascript_driver = :webkit
Capybara.default_driver = Capybara.javascript_driver

class CapybaraTestCase < Test::Unit::TestCase
  include Capybara::DSL

  def test_iframe
    visit "/"

    assert(page.has_content?('TESTING iframe'))
    within_frame("iframe") do
      click_link "next iframe"
      assert(page.has_content?('Iframe 2'), "It should go to the next iframe")
    end
  end

  def teardown
    Capybara.reset_sessions!
    Capybara.use_default_driver
  end
end
