require "minitest/autorun"
require "minitest/spec"

class FeatureSpec < MiniTest::Spec
  require "capybara/poltergeist"
  include Capybara::DSL
  Capybara.register_driver :poltergeist do |app|
  Capybara::Poltergeist::Driver.new(app, {
                    js_errors: false,
                    timeout: 1000,
                    phantomjs_options: [
                              '--load-images=no',
                              '--ignore-ssl-errors=yes',
                              '--ssl-protocol=any']})
  end
  Capybara.default_driver = :poltergeist
  register_spec_type(/page$/, self)
end
