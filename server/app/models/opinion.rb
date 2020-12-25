# チケットとコメントのIDを通し番号にしたかった
class Opinion < ApplicationRecord
  belongs_to :user

  def ticket?
    keep? or problem? or try?
  end

  # TODO: ここの書き方が気に食わない
  scope :tickets_only, -> { where(opinion_type: [1, 2, 3]) }

  enum opinion_type: {
    keep_on: 1,
    problem: 2,
    try_to: 3,
    comment: 4
  }
end