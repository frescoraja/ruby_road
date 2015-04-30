class Friend

  def greeting(name = nil)
      if name != nil
          name = ", #{name}"
      end
      "Hello#{name}!"
  end
end