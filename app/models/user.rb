class User < ApplicationRecord
  has_secure_password
  attr_accessor :current_password

  validates :name, presence: true
  validates :username, format: { with: /\A[\w-]+\z/, message: "doesn't meet format requirements" }
  validates :username, uniqueness: true, presence: true

  def current_password_is_correct
    # Check if the user tried changing his/her password
    if !password.blank?
      # Get a reference to the user since the "authenticate" method always returns false when calling on itself.
      user = User.find_by_id(id)

      # Check if the user CANNOT be authenticated with the entered current password
      if user.authenticate(current_password) == false
        # Add an error stating that the current password is incorrect
        errors.add(:current_password, 'is incorrect.')
      end
    end
  end
end
