def swap_name(name)
  name.split.reverse.join(', ')
end

swap_name('Joe Roberts') == 'Roberts, Joe'
