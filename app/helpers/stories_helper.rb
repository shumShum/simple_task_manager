module StoriesHelper

  def users_for_select
     [['all', nil]] + User.all.map{|u| [u.name, u.id]}
  end

  def states_for_select
    [['all', nil]] + Story.state_machine.states.map(&:name)
  end

end
