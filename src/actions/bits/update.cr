class Bits::Update < BrowserAction
  put "/bits/:bit_id" do
    bit = BitQuery.find(bit_id)
    SaveBit.update(bit, params) do |operation, bit|
      if operation.saved?
        flash.success = "Bit updated."
        redirect to: Users::Show.with(current_user)
      else
        flash.failure = "The bit couldn't be saved"
        html EditPage, save_bit: operation, bit: bit
      end
    end
  end
end
