def super_print(string, options = {})
  defaults = {
    :times => 1,
    :upcase => false,
    :reverse => false
    }
    options = defaults.merge(options)
    new_string = string * options[:times]
    options[:upcase]? new_string.upcase! : new_string
    options[:reverse]? new_string.reverse! : new_string
  end
