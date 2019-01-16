require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  subject(:tiramisu) { Dessert.new('tiramisu', 10, chef) }
  let(:chef) { double("chef", name: 'Flanders') }

  describe "#initialize" do
    it "sets a type" do
      expect(tiramisu.type).to eq('tiramisu')
    end

    it "sets a quantity" do
      expect(tiramisu.quantity).to eq(10)
    end

    it "starts ingredients as an empty array" do
      expect(tiramisu.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new('tiramisu', 'ten', :chef) }.to raise_error(ArgumentError)
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      expect(tiramisu.ingredients).to be_empty
      tiramisu.add_ingredient('ladyfingers')
      expect(tiramisu.ingredients).to include('ladyfingers')
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      tiramisu.add_ingredient('ladyfingers')
      tiramisu.add_ingredient('egg yolk')
      tiramisu.add_ingredient('sugar')
      tiramisu.add_ingredient('whole milk')
      ingredients_copy = tiramisu.ingredients.dup
      tiramisu.mix!

      expect(tiramisu.ingredients).to include('ladyfingers', 'egg yolk', 'sugar', 'whole milk')
      expect(tiramisu.ingredients).not_to eq(ingredients_copy)
    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      tiramisu.eat(3)
      expect(tiramisu.quantity).to eq(7)
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { tiramisu.eat(12) }.to raise_error('not enough left!')
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return('Chef Flanders the Great Baker')
      expect(tiramisu.serve).to include('Chef Flanders the Great Baker')
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(tiramisu)
      tiramisu.make_more
    end
  end
end
