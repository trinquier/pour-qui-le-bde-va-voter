module ItemsHelper

  def list_select_options
    Item::LIST_NAMES.map.with_index { |l,i| [l,i] }
  end

end
