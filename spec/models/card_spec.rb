require "rails_helper"
describe Card do
  describe "#create" do

    it "is valid with a customer_id,card_id,user_id" do
      user=create(:user)
      card = build(:card,user_id: user.id)
      expect(card).to be_valid
    end

    it "is invalid without a customer_id" do
      card = build(:card, customer_id: "")
      card.valid?
      expect(card.errors[:customer_id]).to include("を入力してください")
    end

    it "is invalid without a card_id" do
      card = build(:card, card_id: "")
      card.valid?
      expect(card.errors[:card_id]).to include("を入力してください")
    end

  end
end
