def greetings(arr, hsh)
  "Hello, #{arr.join(' ')}! Nice to have a #{hsh.values.join(' ')} around."
end

greetings(['John', 'Q', 'Doe'], { title: 'Master', occupation: 'Plumber' })
