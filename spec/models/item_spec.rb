require "rails_helper"
describe Item do
  describe "#new" do
    it "is valid without a category_id" do
      item = build(:item, category_id: "")
      item.valid?
      expect(item.errors[:category_id]).to include("を入力してください")
    end

    it "is valid without a name" do
      item = build(:item, name: "")
      item.valid?
      expect(item.errors[:name]).to include("を入力してください")
    end

    it "is valid without a description" do
      item = build(:item, description: "")
      item.valid?
      expect(item.errors[:description]).to include("を入力してください")
    end

    it "is valid without a condition" do
      item = build(:item, condition: "")
      item.valid?
      expect(item.errors[:condition]).to include("を入力してください")
    end

    it "is valid without a delivery_charge_detail" do
      item = build(:item, delivery_charge_detail: "")
      item.valid?
      expect(item.errors[:delivery_charge_detail]).to include("を入力してください")
    end

    it "is valid without a delivery_origin_id" do
      item = build(:item, delivery_origin_id: "")
      item.valid?
      expect(item.errors[:delivery_origin]).to include("を入力してください")
    end

    it "is valid without a delivery_date" do
      item = build(:item, delivery_date: "")
      item.valid?
      expect(item.errors[:delivery_date]).to include("を入力してください")
    end

    it "is valid without a price" do
      item = build(:item, price: "")
      item.valid?
      expect(item.errors[:price]).to include("を入力してください")
    end

    it "is invalid with a name that has more than 41 characters " do
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:name]).to include("は40文字以内で入力してください")
    end

    it "is valid with a name that has less than 40 characters " do
      category = create(:category)
      item = build(:item, name: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",category_id: category.id)
      expect(item).to be_valid
    end

    it "is invalid with a description that has more than 1001 characters " do
      item = build(:item, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
      item.valid?
      expect(item.errors[:description]).to include("は1000文字以内で入力してください")
    end

    it "is invalid with a description that has less than 1000 characters " do
      category = create(:category)
      item = build(:item, description: "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",category_id: category.id)
      expect(item).to be_valid
    end

    it "is invalid without a price that has more than 10000000 characters" do
      item = build(:item, price: "10000000")
      item.valid?
      expect(item.errors[:price]).to include("は10000000より小さい値にしてください")
    end

    it "is invalid without a price that has less than 299 characters" do
      item = build(:item, price: "299")
      item.valid?
      expect(item.errors[:price]).to include("は299より大きい値にしてください")
    end

    it "is valid with a price that has less than 9999999 characters " do
      category = create(:category)
      item = build(:item, price: "9999999",category_id: category.id)
      expect(item).to be_valid
    end

    it "is valid with a price that has more than 300 characters " do
      category = create(:category)
      item = build(:item, price: "300",category_id: category.id)
      expect(item).to be_valid
    end

    it "is invalid without a price that has not haif size" do
      item = build(:item, price: "１０００")
      item.valid?
      expect(item.errors[:price]).to include("は数値で入力してください")
    end

    it "is invalid without a price that has haif size" do
      category = create(:category)
      item = build(:item, price: "1000",category_id: category.id)
      expect(item).to be_valid
    end

    it "is invalid with a category_id that has more than 31 characters " do
      item = build(:item, category_id: "31")
      item.valid?
      expect(item.errors[:category_id ]).to include("は31より小さい値にしてください")
    end

    it "is invalid with a category_id that has less than 9 characters " do
      item = build(:item, category_id: "9")
      item.valid?
      expect(item.errors[:category_id ]).to include("は9より大きい値にしてください")
    end

    it "is invalid with a category_id that has more than 10to30 characters and is valid with elments" do
      category = create(:category)
      item = build(:item,category_id: category.id )
      expect(item).to be_valid
    end
  end
end