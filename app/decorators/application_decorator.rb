class ApplicationDecorator < Draper::Decorator

  #TODO по подсказке из доков draper'а
  # вероятно, это делается не так, но пока это единственный работающий вариант
  def self.collection_decorator_class
    PaginatingDecorator
  end
end