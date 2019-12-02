#!/usr/bin/env ruby

tool = ARGV[0]

$tools = Hash.new

def add_tool(name, prefix)
    $tools[name] = prefix
    $tools[prefix] = prefix
end

add_tool("webstorm", "ws")
add_tool("intellij", "ij")

prefix = $tools[tool]

if prefix == nil
    puts "Invalid editor name: #{tool}"
    puts "  Use: webstorm (ws), intellij (ij)"
    exit 1
end

system "ln", "-sfn", ".#{prefix}.idea", ".idea"

puts "Linked .idea to .#{prefix}.idea"
