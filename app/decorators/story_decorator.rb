class StoryDecorator < ApplicationDecorator
  delegate_all
  delegate :current_page, :total_pages, :limit_value

  STATE_COLORS = {
    new: '#bbb',
    start: '#7fcee2',
    finish: '#f68f85',
    accept: '#ddd',
    reject: '#ffc40d'
  }

  def full_title
    "##{id} #{title}"
  end

  def state_btn_background
    STATE_COLORS[state.to_sym] if state.present?
  end
end