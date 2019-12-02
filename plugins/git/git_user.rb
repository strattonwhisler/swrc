# Set local git user

name = ARGV[0]
email = ARGV[1]

puts "Setting local git user to \"#{name} <#{email}>\"."

system "git", "config", "user.name", name
system "git", "config", "user.email", email