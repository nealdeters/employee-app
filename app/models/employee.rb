class Employee < ActiveRecord::Base

  belongs_to :user
  has_many :grouped_employees
  has_many :groups, through: :grouped_employees

  def friendly_updated_at
    updated_at.strftime("%b %e, %Y")
  end

  def full_name
    "#{first_name} #{last_name}"
  end

  def japan_phone
    phone = phone_number.gsub("-", "")
    full_phone = "+81 #{phone}"
    full_phone.insert(7," ").insert(11," ")
  end

  def salary_currency
    "$#{salary}"
  end

end
