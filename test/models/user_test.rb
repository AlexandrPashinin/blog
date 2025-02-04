# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  last_name              :string           default(""), not null
#  name                   :string           default(""), not null
#  nik_name               :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#
# Indexes
#
#  index_users_on_email                 (email) UNIQUE
#  index_users_on_reset_password_token  (reset_password_token) UNIQUE
#
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # setup do
  #   @user = users(:one)
  # end
  #
  # test "user should be valid" do
  #   puts @user.inspect
  #   assert @user.valid?, @user.errors.full_messages.to_sentence
  # end
  #
  # test "email should be present" do
  #   @user.email = ""
  #   assert_not @user.valid?
  # end
  #
  # test "name should be present" do
  #   @user.name = ""
  #   assert_not @user.valid?
  # end
  #
  # test " nik_name should be present" do
  #   @user.nik_name = "      "
  #   assert @user.valid?
  # end

end
