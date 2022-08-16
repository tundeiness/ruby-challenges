require 'ostruct'

class BoutiqueInventory
  private

  attr_writer :items

  def initialize(items)
    self.items = items.map { |item| OpenStruct.new(item) }
  end

  public

  attr_reader :items

  def item_names
    items.map { |item| item[:name] }.sort
  end

  def total_stock
    items.flat_map { |item| item.quantity_by_size.values }.sum
  end
end
