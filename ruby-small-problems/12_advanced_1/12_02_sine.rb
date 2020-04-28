def sine_row(a, w, ith_line)
  y = ith_line.to_f
  
  # Given the y-coordinate of a point on the sine wave y = a*sin((2*PI/w)*x),
  # determine its x-coordinate using the inverse sine function
  x_co_ord = ((w / (2 * Math::PI)) * Math::asin(y/a)).floor

  case ith_line
  # First, puts the peak of the sine wave
  when a then ' '*x_co_ord + '*'
  # If not at the peak, then puts whitespaces, followed by *, followed by the
  # right number of whitespaces, followed by * again
  else        ' '*x_co_ord + '*' + ' '*(w/2 - x_co_ord*2 - 2) + '*'
  end
end

# Amplitude should be >= 2, and wavelength >= 6, for a shape that actually
# resembles a sine wave
def print_sine(amplitude, wavelength)
  a, w = amplitude.to_f, wavelength.to_f

  # Puts the sine wave for positive y values
  amplitude.downto(0) { |ith_line| puts sine_row(a, w, ith_line) }

  # Now puts the sine wave for negative y values, by inserting
  # (wavelength / 2) whitespace characters into each line, prior to putting
  # the wave in reverse order to above
  0.upto(amplitude) { |ith_line| puts ' '*(w / 2) + sine_row(a, w, ith_line) }
end
