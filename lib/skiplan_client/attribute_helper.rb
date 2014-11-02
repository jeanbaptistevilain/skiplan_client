module AttributeHelper
  def attributes=(hash)
    hash.each do |key, value|
      instance_variable_set("@#{key}", value)
    end
  end

  def attributes
    Hash[instance_variables.map { |name| [name.to_s[1..-1].to_sym, instance_variable_get(name)] }]
  end
end