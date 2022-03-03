class Pokemon < ApplicationRecord
  TYPES = %w[fire water grass rock ground bug ice flying fighting fairy dragon electric steel poison normal ghost dark psychic].freeze

  validates :name, presence: true
  validates :type_1, inclusion: { in: TYPES }, presence: true
  validates :type_2, inclusion: { in: TYPES }, exclusion: { in: ->(pokemon) { [pokemon.type_1] } }, allow_nil: true, allow_blank: true
end
