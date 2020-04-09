class Employee < ApplicationRecord
    belongs_to :dog

    validates :title, uniqueness: true
    validates :first_name, uniqueness: {scope: :last_name}
end
