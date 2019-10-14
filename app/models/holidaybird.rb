class Holidaybird < ApplicationRecord
  establish_connection "turkeytote".to_sym
end
