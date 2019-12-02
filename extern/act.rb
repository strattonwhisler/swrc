#!/usr/bin/ruby

commands = Array.new

$shorts = Hash.new

def add_shorthand(char, command)
    $shorts[char] = command
end

add_shorthand 'r', 'run'
add_shorthand 'c', 'clean'
add_shorthand 'x', 'compile'
add_shorthand 't', 'test'

ARGV[0].chars.each do |arg|
    command = $shorts[arg]
    
    if command == nil
        commands = Array.new
        break
    else
        commands.push(command)
    end
end

args = commands.length == 0 ? ARGV : ARGV[1..-1]
args.each do |arg|
    commands.push(arg)
end

begin
    puts "activator #{commands.join ' '}"
    exec "activator", *commands
rescue SignalException
    exit 0
end
