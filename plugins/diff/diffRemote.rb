#!/usr/bin/ruby

puts `diff -B <(curl -s "#{ARGV[0]}") <(curl -s "#{ARGV[1]}")`

exit 0

