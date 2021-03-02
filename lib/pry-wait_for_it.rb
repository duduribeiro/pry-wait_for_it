# frozen_string_literal: true

require "concurrent"
require "pry"

class Object
  def pry_wait_for_it
    Pry.start(self, {}) if PryWaitForIt.state.true?
  end

  def pry_wait_activate
    PryWaitForIt.state.make_true
    yield
    PryWaitForIt.state.make_false
  end
end

module PryWaitForIt
  def self.state
    @state ||= Concurrent::AtomicBoolean.new(false)
  end
end
