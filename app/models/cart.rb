class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    @contents.values.sum
  end

  def add_item(item_id)
    @contents[item_id.to_s] ||= 0
    @contents[item_id.to_s] += 1
  end

  def remove_item(item_id)
    item_id_str = item_id.to_s
    if @contents.key?(item_id_str)
      @contents[item_id.to_s] -= 1
      if @contents[item_id.to_s] <= 0
        @contents.delete(item_id.to_s)
      end
    end
  end

  def remove_all_item(item_id)
    item_id_str = item_id.to_s
    if @contents.key?(item_id_str)
      @contents.delete(item_id.to_s)
    end
  end

  def count_of(item_id)
    @contents[item_id.to_s].to_i
  end

  def grand_total
    total = 0
    Item.where(id: @contents.keys).each do |item|
      total += (item.price * count_of(item.id))
    end
    total
  end

  def item_discount_ten(item)
    item.price * 0.90
  end

  def item_discount_twenty(item)
    item.price * 0.80
  end

  def discount(item)
    if item.discount
      if count_of(item.id) < 10
        item.price
      elsif count_of(item.id) >= 10 && count_of(item.id) <= 19
        item_discount_ten(item)
      else count_of(item.id) > 20
        item_discount_twenty(item)
      end
    else
      item.price
    end
  end

  def sub(item)
    if item.discount
      if count_of(item.id) < 10
         item.price * count_of(item.id)
      elsif count_of(item.id) >= 10 && count_of(item.id) <= 19
         item_discount_ten(item) * count_of(item.id)
      else count_of(item.id) > 20
         item_discount_twenty(item) * count_of(item.id)
      end
    else
      item.price * count_of(item.id)
    end
  end

  def discounted_total(item_subs)
    total = 0
    Item.where(id: @contents.keys).each do |item|
      total += (item.price * count_of(item.id))
    end
    if item_subs
      difference = total - item_subs
      gt = total - difference
      gt
    end
  end
end
