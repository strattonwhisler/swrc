#!/usr/bin/ruby

commands = Array.new
ARGV[0].chars.each do |arg|
    if arg == "r"
        commands.push("run")
    elsif arg == "c"
        commands.push("clean")
    elsif arg == "x"
        commands.push("compile")
    end
end

if commands.length == 0
    ARGV.each do |arg|
        commands.push(arg)
    end
end

begin
    exec "activator", *commands
rescue SignalException
    exit 0
end
