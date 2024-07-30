# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  post_id    :integer
#
class Comment < ApplicationRecord
  belongs_to :post
  validates :body, presence: true, length: {minimum:1 , maximum:255}
end
