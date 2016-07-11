class User < ActiveRecord::Base
  #before_validation :valid_password
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  
  GENDERS = ['man', 'woman']
  validates :first_name, :last_name,  :password, :date_of_birth, :gender, presence: true
  validates :gender, inclusion: GENDERS
  validates :password, length: { minimum: 10 }
  validate  :valid_date?
  validate  :valid_password
    
  def valid_password
    upper = 'A'..'Z'
    lower = 'a'..'z'
    count = [0, 0, 0]
    self.password.each_char do |ch|
      count[0] += 1 if upper.include? ch
      count[1] += 1 if lower.include? ch
      count[2] += 1 if is_integer? ch     
    end
    errors.add(:password, :invalid) unless count[0] >= 2 && count[1] >= 2 && count[2] >= 2  
  end


  def valid_date?
    interval = Date.today.prev_year(60)..Date.today.next_year(60)
    errors.add(:date_of_birth, :invalid) unless interval.include? self.date_of_birth
  end

  def is_integer?(string)
    true if Integer(string) rescue false
  end

end

# QWErty123456   true
# 1234567890     false 