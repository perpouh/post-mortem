class Opinion < ApplicationRecord
  def ticket?
    keep? or problem? or try?
  end

  enum opinion_type: {
    keep: 1,
    problem: 2,
    try: 3,
    comment: 4,
  }
end