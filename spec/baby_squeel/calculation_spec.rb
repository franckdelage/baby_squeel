require 'spec_helper'

RSpec.describe BabySqueel::Calculation do
  let(:table) { Arel::Table.new('posts') }

  describe '#node' do
    it 'reads the attribute' do
      calculation = described_class.new(table[:id])
      expect(calculation.node).to eq(table[:id])
    end
  end

  describe '#type_cast_from_database' do
    it 'just returns what you pass in' do
      calculation = described_class.new(table[:id])
      expect(calculation.type_cast_from_database(1)).to eq(1)
    end
  end

  describe '#to_s' do
    it 'generates a name for attribute' do
      calculation = described_class.new(table[:id])
      expect(calculation.to_s).to eq('posts_id')
    end

    it 'generates a name for expressions' do
      node = table[:id] + table[:view_count]
      calculation = described_class.new(node)
      expect(calculation.to_s).to eq('posts_id_view_count')
    end
  end
end
