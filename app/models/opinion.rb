class Opinion < ApplicationRecord
  def ticket?
    keep? or problem? or try?
  end

  # TODO: ここの書き方が気に食わない
  scope :tickets_only, -> { where(opinion_type: [1,2,3]) }

  enum opinion_type: {
    keep: 1,
    problem: 2,
    try: 3,
    comment: 4,
  }
end