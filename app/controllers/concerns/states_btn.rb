module Concerns
  module StatesBtn
    STATES_BTN = {
      new: [{label: 'start', color: '#7fcee2'}],
      start: [{label: 'finish', color: '#f68f85'}],
      finish: [{label: 'accept', color: '#ccf2b9'}, {label: 'reject', color: '#ffc40d'}],
      accept: [],
      reject: [{label: 'start', color: '#7fcee2'}]
    }

    def states_btn
      STATES_BTN
    end

  end
end