require 'spec_helper'

describe Category do
  it { expect(subject).to have_many(:category_histories) }
end