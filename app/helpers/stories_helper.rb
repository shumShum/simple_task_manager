module StoriesHelper

  STATE_COLORS = {
    new: '#bbb',
    start: '#7fcee2',
    finish: '#f68f85',
    accept: '#ddd',
    reject: '#ffc40d'
  }

  def state_color(state)
    STATE_COLORS[state.to_sym] if state.present?
  end

  #TODO как-то сложно, но как по-другому получить хеш вида {user1.name => user1.id, user2.name > user2.id, ...} пока не знаю
  # возможно, нужно использовать другой хелпер (не options_for_select), но возникает проблема с наличием {'all' => nil} в списке
  def users_for_select
    User.all.map{|u| {u.name => u.id}}.reduce Hash.new.merge({'all'=>nil}), :merge
  end

end
