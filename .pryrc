# -*- mode: ruby -*-

Pry.hooks.add_hook(:before_session, "use FactoryBot shorthand") do |output, binding, pry|
  Object.include FactoryBot::Syntax::Methods
end
