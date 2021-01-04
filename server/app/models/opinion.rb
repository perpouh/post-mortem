# チケットとコメントのIDを通し番号にしたかった
class Opinion < ApplicationRecord
  belongs_to :user

  def ticket?
    keep_on? or problem? or try_to?
  end

  # TODO: ここの書き方が気に食わない
  scope :tickets_only, -> { where(opinion_type: %i[keep_on problem try_to]) }

  scope :comments_only, -> { where(opinion_type: :comment) }

  enum opinion_type: {
    keep_on: 1,
    problem: 2,
    try_to: 3,
    comment: 4
  }

  validates :body, presence: true, length: { minimum: 1, maximum: 1000 }
end