require 'test/unit'
require "../lib/less_logs"

class LessLogsTest < Test::Unit::TestCase
   
   def test_x
    res = Less::Logs::Event.create {}
    assert_equal "x", res.parsed_repsonse
   end
   
end
