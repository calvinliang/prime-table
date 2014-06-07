require 'test/unit'
require './lib/prime'
require 'stringio'

class PrimeUnitTest < Test::Unit::TestCase

  # Taken from http://stackoverflow.com/a/4459729
  # Captures the output from stdout and assigns it to a string
  def capture_stdout
    real_stdout, $stdout = $stdout, StringIO.new
    yield
    $stdout.string
  ensure
    $stdout = real_stdout
  end

  def test_new_default
    ten = "\t2\t3\t5\t7\t11\t13\t17\t19\t23\t29\n2\t4\t6\t10\t14\t22\t26\t34\t38\t46\t58\t\n3\t6\t9\t15\t21\t33\t39\t51\t57\t69\t87\t\n5\t10\t15\t25\t35\t55\t65\t85\t95\t115\t145\t\n7\t14\t21\t35\t49\t77\t91\t119\t133\t161\t203\t\n11\t22\t33\t55\t77\t121\t143\t187\t209\t253\t319\t\n13\t26\t39\t65\t91\t143\t169\t221\t247\t299\t377\t\n17\t34\t51\t85\t119\t187\t221\t289\t323\t391\t493\t\n19\t38\t57\t95\t133\t209\t247\t323\t361\t437\t551\t\n23\t46\t69\t115\t161\t253\t299\t391\t437\t529\t667\t\n29\t58\t87\t145\t203\t319\t377\t493\t551\t667\t841\t\n"
    p = Prime.new()

    table = capture_stdout do
      p.start()
    end
    assert_equal(table, ten)
  end

  def test_new_11
    eleven = "\t2\t3\t5\t7\t11\t13\t17\t19\t23\t29\t31\n2\t4\t6\t10\t14\t22\t26\t34\t38\t46\t58\t62\t\n3\t6\t9\t15\t21\t33\t39\t51\t57\t69\t87\t93\t\n5\t10\t15\t25\t35\t55\t65\t85\t95\t115\t145\t155\t\n7\t14\t21\t35\t49\t77\t91\t119\t133\t161\t203\t217\t\n11\t22\t33\t55\t77\t121\t143\t187\t209\t253\t319\t341\t\n13\t26\t39\t65\t91\t143\t169\t221\t247\t299\t377\t403\t\n17\t34\t51\t85\t119\t187\t221\t289\t323\t391\t493\t527\t\n19\t38\t57\t95\t133\t209\t247\t323\t361\t437\t551\t589\t\n23\t46\t69\t115\t161\t253\t299\t391\t437\t529\t667\t713\t\n29\t58\t87\t145\t203\t319\t377\t493\t551\t667\t841\t899\t\n31\t62\t93\t155\t217\t341\t403\t527\t589\t713\t899\t961\t\n"
    p = Prime.new(11)

    table = capture_stdout do
      p.start()
    end
    assert_equal(table, eleven)
  end

  def test_new_0
    zero = ""
    p = Prime.new(0)

    table = capture_stdout do
      p.start()
    end
    assert_equal(table, zero)
  end

  def test_new_negative_one
    negative_one = ""
    p = Prime.new(-1)

    table = capture_stdout do
      p.start()
    end
    assert_equal(table, negative_one)
  end

  def test_new_hello
    hello = ""
    p = Prime.new("hello")

    table = capture_stdout do
      p.start()
    end
    assert_equal(table, hello)
  end
end