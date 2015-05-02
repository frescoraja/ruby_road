def super_print(input, options = {})
  defaults = {
    :times => 2,
    :upcase => false,
    :reverse => false
  }

  options = defaults.merge(options)
  new_string = input * options[:times]
  options[:upcase] ? new_string.upcase! : new_string
  options[:reverse] ? new_string.reverse! : new_string
  new_string

  # options.each do |key, value|
  #   next unless !!value == value
  #   input = input.send(key) if value == true
  # end
  # input * options[:times]

end
