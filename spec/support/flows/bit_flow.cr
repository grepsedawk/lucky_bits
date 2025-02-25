class BitFlow < AuthenticatedBaseFlow
  def visit_bit_index
    visit Bits::Index
  end

  def visit_group_index
    visit Groups::Index
  end

  def visit_group(title)
    el("@group-title", text: title).click
  end

  def goto_global_new_bit_form
    click "@new-bit-link"
  end

  def goto_group_new_bit_form
    click "@new-group-bit-link"
  end

  def click_on_edit_bit(bit : Bit)
    click "@edit-bit-#{bit.id}"
  end

  def click_on_delete_bit(bit : Bit)
    click "@delete-bit-#{bit.id}"
  end

  def submit_bit_form
    click "@bit-form-submit"
  end

  def submit_new_bit
    fill_form(
      SaveBit,
      title: "LinkyBits",
      url: "https://linkybits.net",
      description: "Maybe we could use this to share links?"
    )
    click "@create-bit-form-submit"
  end

  def should_see_bit_on_page
    el("@bit-title", text: "LinkyBits").should be_on_page
  end
end
