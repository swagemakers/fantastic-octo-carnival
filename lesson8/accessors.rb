module Accessors
  attr_reader :attr_name

  def self.included(base)
    base.extend Accessors
  end
  #automatically connects the module to any code
  def strongly_typed_accessor(name, class_attr)
    define_method(name) do
      instance_variable_get("@#{name}")
    end

    define_method("#{name}=") do |value|
     if value.is_a?(class_attr)
          instance_variable_set("@#{name}", value)
      else
        raise ArgumentError, "Invalid accessor type"
      end
    end
  end

  def accessor_with_history(name)
    name = name.to_s
    name_with_history = name + '_history'

    define_method(name) {instance_variable_get("@#{name}")}
    #получает необходимую переменную
    define_method(name_with_history) {instance_variable_get ("@#{name_with_history}")}
    #получает необходимую перменную с истрией значений
    define_method("#{name}=") do |value| #переменная совершает следующие действия со значением
      instance_variable_set(name_with_history, []) unless instance_variable_defined?(name_with_history)
      #создает новую переменную с историей значений в виде массива, если она еще не определенна
      instance_variable_get(name_with_history) << instance_variable_get(name)
      #складывает в массив новые значения, которые получает переменная
      instance_variable_set(name, value)
      #устанавливает для переменной самое новое значение
    end

    define_method("#{name_with_history}") {instance_variable_get("#{name_with_history}")}
  end
end
