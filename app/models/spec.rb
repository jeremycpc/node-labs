class Spec < ApplicationRecord
  belongs_to :component, optional: true
  belongs_to :category
  belongs_to :computer

  scope :with_component, -> { where.not(component_id: nil) }
  scope :without_component, -> { where(component_id: nil) }

  validates :component, presence: true, if: :mandatory?

  STEPS = {
    1 => "cases",
    2 => "motherboards",
    3 => "processors",
    4 => "memory",
    5 => "storage",
    6 => "graphic_cards",
    7 => "power_supply",
    8 => "cpu_coolers",
    9 => "case_cooling",
    11 => "sound_cards",
    10 => "network_cards",
    12 => "operating_systems"
  }

  def mandatory?
    Category::MANDATORIES.include?(self.category.slug)
  end

  def position
    STEPS.index(category.slug)
  end
end
