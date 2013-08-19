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

  def users_for_select
     [['all', nil]] + User.all.map{|u| [u.name, u.id]}
  end

  def states_for_select
    [['all', nil]] + Story.state_machine.states.map(&:name)
  end

end
