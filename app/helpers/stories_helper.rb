module StoriesHelper
  STATE_COLORS = {
    new: '#bbb',
    start: '#7fcee2',
    finish: '#f68f85',
    accept: '#ddd',
    reject: '#ffff99'
  }

  def state_color(state)
    STATE_COLORS[state.to_sym] if state.present? 
  end
end
