def categorize_birds(birds)
  yield(birds)
end

birds = %w(raven finch hawk eagle)

categorize_birds(birds) { |_, _, *raptors| p raptors }
